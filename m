Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADBC186F71
	for <lists+samba-technical@lfdr.de>; Mon, 16 Mar 2020 16:57:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=/G8EEmRy7DbaJQlXDAOdKHmatKVrz4a4uYEgizdxteE=; b=hiJzsGCKGw9Uih0B32ZCrFd4tW
	IGRN/8iXPx2MCykzki9j0QtAqMftxniH2do7ifL0pM1vvF/axxSaQMvTI2/ehIxdNdEJhnIHJ8CWo
	1uN2VwLuROoFrUvyuGjqkCjJEvEBF0xUdLbyV3lUX0rxzlxnxkpE24b0Ozzvy/K17fKFjLY3yPQKn
	lixYHmt4yGrCcmcB91i2BVxLzsS/PhR3ZZ3jxzqal1xPFpxPd2dRlJrk1hUr87/ul4M7D2HJMXiFe
	ScmB352xTCnUcDeKnhlByIUwVhuyelSt8ZHvhqUC331qdDOiBDECnXuae2QReHNX6kbqqQGjVdsjt
	AH8izyVg==;
Received: from localhost ([::1]:42652 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jDs6P-000Ae7-75; Mon, 16 Mar 2020 15:56:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54744) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jDs6K-000AdZ-N3
 for samba-technical@lists.samba.org; Mon, 16 Mar 2020 15:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=/G8EEmRy7DbaJQlXDAOdKHmatKVrz4a4uYEgizdxteE=; b=PlX5+H7PJeNs8Et25PPppd5iZm
 bsBoD8wSnWWWGtNMD/LJnG26sykOJKGhZ8t+rHmeRjxAYw1oXa9V8ngjU0AIX1mzaH23dfIyLuzkH
 wc2hlSxptgUqrz1O3I/MUqR/Icxp6r0BFhvA6H8EWA8IL1MY6DbuQFQ5WeQZsNdr9VZWhSYFY9YBp
 mEBIWwr+GoMz54RkLr9LpJojoGN+AqOGZsnmHflpNbOb81lqzIjs2kZsdKARdkRI0TuSzOeN2mB00
 LisX9kMnjjg8QEoc5VmKX+qakr1lrAHmpDHPKmJKZH2XJy5YDrxWsYUfGzAiTdcqhwUMI/g90PYhD
 txeA65GZ+y0cMo4QKPoTbaqaMR3FlqLWDQl7t52bt8Q5Zrql+Z9KAwJKb4DsMmf1A2uroRsatEuEF
 u/0XanZmoXP8kPN7Lilel6ziU78JVAiqGh9B4cyOKWx87MXkRsPt6CgFfvz5+0zaIHFd9U499Re0v
 k1stTQ9EXartc/Xf4patDefI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jDs6K-0000Rd-9R
 for samba-technical@lists.samba.org; Mon, 16 Mar 2020 15:56:24 +0000
To: samba-technical@lists.samba.org
Subject: A question about LDB contexts in the standard and prefork process
 models
Message-ID: <5c5bca48-d685-4144-49ed-7e63d2449087@samba.org>
Date: Mon, 16 Mar 2020 17:56:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Nadezhda Ivanova via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nadezhda Ivanova <nivanova@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi team,

For various reasons I got very much behind the current state of samba, 
and I am trying to remedy that :). So I was looking into the work of the 
LDAP server, and based on the code and some debugging, it seems to me 
that a new ldb context is created per connection, when samdb_connect is 
done during bind, and the same context is used until the connection is 
closed. So, am I right in understanding that in standard process model, 
there is essentially a separate ldb context per process, whereas in 
pre-fork, there is still one per connection, but is shared between 
processes? Also, it is unclear to me still what  ldap_service->sam_ctx 
is used for?

Thanks,

Nadya


