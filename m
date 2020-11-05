Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 948E12A7BAC
	for <lists+samba-technical@lfdr.de>; Thu,  5 Nov 2020 11:25:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=V3G04q5eXV69wGuj9H5E3yyPNhya3cIzi6avdx0ytnw=; b=mpkimwKP7QiNWbz4ARg6v39Dkf
	KZ+IYHqmervZWFbv5Oqtoqm0YdWSEFVhQ28//756G3qWcJ1BtEEgNbGAYsm+2WLIh/2W0+VaaQRgP
	qGyNLSPGgzjJBb90kLfhvHUtP1D06kp+KbiEw71PgEghxQBnjJErKQq0/JTHlX/hK0AQXG9s45X6o
	qZaMmBYkqsfQ1m4LR2wb+9m2c6ZVuHsiqiKMf9I9yP89xkaKWKxxPX0uZAXJSaIhLFphNNKoqZV8J
	fuZA/yIW9j6YPeOXXEiVAIvK8KGzxvDPFz3wrQOqxmmlIOyWoTBJxXjsiQxBc8UbHuuMjtpJlEpyh
	fzc9lN9w==;
Received: from ip6-localhost ([::1]:62808 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kacSQ-0001l2-6R; Thu, 05 Nov 2020 10:25:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46100) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kacSJ-0001kA-Bt
 for samba-technical@lists.samba.org; Thu, 05 Nov 2020 10:25:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=V3G04q5eXV69wGuj9H5E3yyPNhya3cIzi6avdx0ytnw=; b=gnLZ65UUOAXCDIMA3ghrhUC19U
 ktanf4nvAgwGIET2dGoOHwBO3i/EvKXfvFp0GD95zBYRfLpTVm7wTFRnruAUTZXLQCaixXeWeZ2k/
 X+mYj9sRtqG9PmxFBJ//FzqEbxc45ax/qDj9L50etS3vRPW8zy/B9fD1QXqpiFoFA6/p4D44eqL6Q
 iE7ozDgWeEqIQLB6+C3BILuSw6KDYeCJA6Ec8164C/nBz28NsPf45z3ptRk+rXYhPq/0DwCjpzR+1
 GCv4gm5N1yEUAVpuYnwRnoEobPw6A1S2fLWPzDD33su20arNGeJhqVEmy36LqBoWcmwu8cPMthTWj
 oAkMOhRDGVP3FXRThJESE6fMbJwX6q4EaLH1GGQH6VdSfNr3FHsF60p32nU/53jE2AgYEOIC5IdWP
 ooyNP/OLb+UskJus2l1UclN7v47hkEWn/Ee72Fb3yh0kgE1rTMgGBc1gMwzyKDXl/fKfDqFkWcKZW
 +BQLCEMYoEDkjxAFhtds1sml;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kacSG-0001oc-Kr
 for samba-technical@lists.samba.org; Thu, 05 Nov 2020 10:25:21 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.12] Samba 4.12.11
Organization: Samba Team
Message-ID: <863f3539-bbda-994c-1dbc-a45fcaed1418@samba.org>
Date: Thu, 5 Nov 2020 11:25:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
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

Samba 4.12.11 is scheduled for Thursday, January 14 2021.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.12
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

