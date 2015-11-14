SELECT
        STOCKS.*
        ,COUNT(STOCK_KNOWLEDGES.KNOWLEDGE_ID) AS KNOWLEDGE_COUNT
    FROM
        STOCKS
            LEFT OUTER JOIN STOCK_KNOWLEDGES
                ON STOCKS.STOCK_ID = STOCK_KNOWLEDGES.STOCK_ID
    WHERE
        STOCKS.INSERT_USER = ?
        AND STOCKS.DELETE_FLAG = 0
    GROUP BY
        STOCKS.STOCK_ID
    ORDER BY
        KNOWLEDGE_COUNT DESC LIMIT ? OFFSET ?

