 Создать индексы для быстрого выполнения запросов
 
 CREATE INDEX order_id ON public.order_product USING btree (order_id)
 CREATE INDEX product_id ON public.order_product USING btree (product_id)
