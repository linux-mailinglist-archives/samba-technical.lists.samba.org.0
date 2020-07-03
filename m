Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEEE213806
	for <lists+samba-technical@lfdr.de>; Fri,  3 Jul 2020 11:50:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=gOu+BfMVkiIj5SExeKdyG1NbXIYpxZUb8YaGJjpD0FI=; b=jvtKoj1Xw+UbOMs3Bb+Y63S7qU
	k0vMkh6N5PQvrz+tSblEIkwvE4nPacXibmqUCRhwMdfSk3fk/jxOv/oEXtrgQsd37Vx4YjwdJSZ3w
	B9AyXmcFFOx5v3t5RO7zWuQOz0p/DF1MVEHjUfpnCue9RQwwMPionlPyiR+0murF0WbwBZtuTnr+6
	QiokzgOQtHP9MJR6a0sNw8ywAgeaPsuJ7EuR9OTmU/RYK91/ZPk5F13emoTcK2+jOerJFt1fWz4OA
	PrQqLYvSSURpFsw0uu88qI1za0AvNINC/C2GdFXmBFmiJd19rro/yeMmwAbKqhvl2Rs1gB4m2sTAd
	DH4TL0LA==;
Received: from localhost ([::1]:60430 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jrIKG-005FLc-SU; Fri, 03 Jul 2020 09:49:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48570) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jrIKB-005FLV-2E
 for samba-technical@lists.samba.org; Fri, 03 Jul 2020 09:49:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=gOu+BfMVkiIj5SExeKdyG1NbXIYpxZUb8YaGJjpD0FI=; b=krqeCgZK9eoKI5QW0GjGl0Iywy
 DwzDqe0ys0BhZc4Py3phCVl49pULD/XTGwj7ecZHULwwyMWRdtyn0PpG2BtwwD731g0kyitRINdgI
 Ucw9LzKwqZa/FzcwE6zMe7VwCMX5bNRuQFpwDzUrovAAHnMC5vH8ZdETOS3wNB+FjKkiTNVYr7Pyf
 RVJp4EtJXpttVa0uqXt7kVF3Li2jy0GfqTXXVD4fJqzs5KCcB6DOt/l5Ox0HgxhV9jm/yYtWfVvGz
 UWZFD0IlueoAyVKpcqHiLE/Bq1uM1UtO5NnMMxWJvy7rFUsyPXekEkShru3Rk883edvxCOymbL6Um
 1mH6C/3Mj6BnE0SZmDe63Cy6U+pItec5O8GCzOkSEeOl7voM+uh6HeQ+UKCap035o3Eldea8+/gIC
 mu2j3cUnaUT6cbY3j6PLKZ2VB+Z3NWMj8B411g5yOQLakhBy/BDvXlUfq9mh1jYzmygL3qiVXuFaX
 Xkr3UqbSsEty4Q72ctnhoTMs;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jrIKA-0001Gz-KT
 for samba-technical@lists.samba.org; Fri, 03 Jul 2020 09:49:38 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.11] Samba 4.11.12
Organization: Samba Team
Message-ID: <d3c1cf76-91bf-ac64-4e4a-38917dbe1920@samba.org>
Date: Fri, 3 Jul 2020 11:49:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.11.12 is scheduled for Tuesday, August 25.
The release branch will be frozen on Tuesady, August 18.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.11
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

