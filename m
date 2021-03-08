Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAA83317F6
	for <lists+samba-technical@lfdr.de>; Mon,  8 Mar 2021 20:59:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=+cfqzupEltW95/Eshb5XvDdg8AoOGzkYzFqGf2YUiT4=; b=fe5h9HGNB0O49Y2bzG8Dww5hrG
	jGIAaZFwEI4UhJyR/o5DQ9PHqb9f6Sooj1/6uglAuwuokgZHQp1wY1a3WM90pHsH+o7XFSS2Jonn6
	+FaFsu/qumM6LjXiw+aTFF/Ddw9Svvh4maz7kfekcs62Xh30EIm5DaADI9mJUXW5ySTa86rWSIsYc
	t9YoYwyJPQTKZa3Vn2xKE7mObSkRHQbmwQO3e1VfWMYYZpCbAW9AxUGATBf9FBUPqDUMR8nzX4Ha1
	VFf43kHffz4xCXpRHhOfIj6fZj0Vn3TTrAUOZ2++FaQfsMhek2SloUBK4GbSzFjVVdoV5/6s1e+J0
	AoFsawPg==;
Received: from ip6-localhost ([::1]:46766 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lJM1j-004WT3-GF; Mon, 08 Mar 2021 19:58:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60770) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lJM1e-004WSw-Gz
 for samba-technical@lists.samba.org; Mon, 08 Mar 2021 19:58:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=+cfqzupEltW95/Eshb5XvDdg8AoOGzkYzFqGf2YUiT4=; b=SpYgF3CaImt+sFwiSkvxryvits
 SWEzOwC9tOxOmKxuov5kKBkHnnW0XaQN2TsqAsHgHfPm9fizp+K5Noi8Lb2fJmEOc3LNBQy3dsvwE
 j6k/z+mr0PctnspvWP76rGB+tKaG4oLGH8JGPJQRET+aeOzzqV+JlmgMem+YhgE8uJb5S74VTPo/f
 g768xQRwuN7KnYfHVuBEkq7N9PJkBapBdZVg7EBl/14LZBi6/UTjoANZPR4ZLNz5Welh8D2z3sBD0
 YyzT/2F+anJu4nGrgqSGzkIHn/BFRQd4PDU7cg943/B7VorDsKAzKV9TBuNvkBP/NVvs07lTZnb63
 ZNT2qeddVeQFcNOqWDzhELIPSel/W67r+O7IHveKiRDPjFobuGKReg1ZbyieDFA1jK5kd14+1I+MI
 9lMKRa6IYCCh4NaNHdiVM2a4dSIg2U/SJR/YcqUBtx2WpfuCRQ83PGRZQkWnS0roPWXkb9+hSD+n0
 qbXeqpUDvsLrfOVpRiJ7mAmC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lJM1c-0004Ik-LU
 for samba-technical@lists.samba.org; Mon, 08 Mar 2021 19:58:45 +0000
Message-ID: <9b7c2a3950f44e60165cf49471b12f536d3f50be.camel@samba.org>
Subject: Fixed the github.com sync
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Tue, 09 Mar 2021 08:58:40 +1300
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Sorry for the service outage on our gitlab.com mirror.  I tried to
reduce the load by only doing a push when we actually got a change and
instead made it never update.

The non-master branches on gitlab.com will also be update again.

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


