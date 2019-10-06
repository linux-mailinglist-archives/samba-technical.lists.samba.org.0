Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E52DCD96B
	for <lists+samba-technical@lfdr.de>; Mon,  7 Oct 2019 00:18:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=aT8c/e0JiCG07rvAYU3NfpHQmzkD7/onkE0jcKyGlYg=; b=h5pw5W0gPfYJxB6d1CbCYmilPw
	yQLqaz5dNmsS3Chx3HSxxbYRShlZ6X+yx9cKOcMJGjJ4FofMOA2QcHe2KOc/huFfTXcKVMLJuWhgZ
	GJo3k8wazmyqrXtLsCnJrMRk5ID3jqq70S2Ts1mAbIILoAa9llo+03Ao8Q0K/0jgrcrbxN69ut8a5
	mlXmVOylawN+T/8mLNfhBHmnCZDugeWdy4FOrUaxdhyqaskxb4mTICLeYlBQakyVfncExZ35MM+c/
	b9dDLrwHCY1oKoISlsqDnUvaenk43lu6RLJG9qYmFtWWEbm05qJYYXrE5ggbezKDAuh4fhxpAWV6R
	ku9ZwgZA==;
Received: from localhost ([::1]:64944 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iHErb-001fOy-GW; Sun, 06 Oct 2019 22:18:51 +0000
Received: from [185.16.48.59] (port=55162 helo=smtp.tranquil.it) 
 by hr1.samba.org with esmtp (Exim) id 1iHErX-001fOr-3K
 for samba-technical@lists.samba.org; Sun, 06 Oct 2019 22:18:49 +0000
Received: from mail.tranquil.it (mail.tranquil.it [185.16.48.58])
 by smtp.tranquil.it (Postfix) with ESMTPS id 88D0540279
 for <samba-technical@lists.samba.org>; Mon,  7 Oct 2019 00:18:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tranquil.it; s=mail;
 t=1570400324; bh=aT8c/e0JiCG07rvAYU3NfpHQmzkD7/onkE0jcKyGlYg=;
 h=From:Subject:To:Date;
 b=gsjwwzC1n68vAG2o8ejcqDslrNh+D9y4rYaSQOOeazt0h2p46EWye0yMtI9I7p2XQ
 dIJfOHUDnSoiLENdNz24L3kjF9BZlMRVfXV59yEYkGlrP1bxwuJhcGjY3F0UtVCSjT
 uifQCbQuIGC7Wqf+V7NQ5elU4ZAFl6OH9uCj/ow4=
Received: from localhost (localhost [127.0.0.1])
 by mail.tranquil.it (Postfix) with ESMTP id 735EE141
 for <samba-technical@lists.samba.org>; Mon,  7 Oct 2019 00:18:48 +0200 (CEST)
Received: from mail.tranquil.it ([127.0.0.1])
 by localhost (mail.tranquil.it [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id eCKRs7DO7JDl; Mon,  7 Oct 2019 00:18:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.tranquil.it (Postfix) with ESMTP id 3310615B;
 Mon,  7 Oct 2019 00:18:48 +0200 (CEST)
Received: from mail.tranquil.it ([127.0.0.1])
 by localhost (mail.tranquil.it [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Tbyk0qcjFeWY; Mon,  7 Oct 2019 00:18:48 +0200 (CEST)
Received: from srvlts1.ad.tranquil.it (bureau-sdsl.tranquil.it [185.16.50.4])
 by mail.tranquil.it (Postfix) with ESMTPSA id 184C5141;
 Mon,  7 Oct 2019 00:18:48 +0200 (CEST)
Subject: acl propagation during replication (bugzilla #12497)
To: samba-technical <samba-technical@lists.samba.org>
Message-ID: <29cb4796-40f6-57f2-8dd6-c8a4d9940fc9@tranquil.it>
Date: Mon, 7 Oct 2019 00:18:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
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
From: Denis Cardon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Denis Cardon <dcardon@tranquil.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi everyone,

I would like to know what is the best way y'all are using to mitigate=20
the acl propagation bug[1] after replication.

Are you using dsacls on windows to force inheritance propagation on=20
every DC? Or just do the delegation on the site DC where the delegated=20
admin is working?

Cheers,

Denis

[1] https://bugzilla.samba.org/show_bug.cgi?id=3D12497

--=20
Denis Cardon
Tranquil IT
12 avenue Jules Verne (Bat. A)
44230 Saint S=C3=A9bastien sur Loire (FRANCE)
tel : +33 (0) 240 975 755
http://www.tranquil.it

Tranquil IT recrute! https://www.tranquil.it/nous-rejoindre/
Samba install wiki for Frenchies : https://dev.tranquil.it
WAPT, software deployment made easy : https://wapt.fr

