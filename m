Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BDA33B109
	for <lists+samba-technical@lfdr.de>; Mon, 15 Mar 2021 12:28:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=TT3OINmgwnbCpufJ2dykG3LLhgiHm8SRf3/qDWnx8PY=; b=5gtX0zavhdnPkITvewrNbIH9eU
	7U6H0Zkf1ZcnKa7HGNPLZns4szaywOMyaUC2Nuu32UImVzyzzfh14HKgAwtM9MG0hCcCG03mb3XN4
	gUqllKS82Z4ZeJ/NF99lZ7UorJbQ9fM35l5ZT33aGD6OYJvK+ShrNk9z+9aBWfigcwyD7mf+Tij56
	8y4gkDrPo0t78CwqIbDgjZrh/zBhMhvBzrIWG8PLG5izB/mlVc/arm2Ul+Az24zclZKq8Wr7Bzvlt
	V1fy+uB2Kt7+gF1rn0nz/W4yGGv64wvEgvWzoZtOlNKk7742h+jYdvK26dpgSnsWsF3o/lZIAeNDh
	MdY1p8TQ==;
Received: from ip6-localhost ([::1]:63348 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lLlNQ-005XtM-6B; Mon, 15 Mar 2021 11:27:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23358) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lLlNL-005XtF-D4
 for samba-technical@lists.samba.org; Mon, 15 Mar 2021 11:27:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=LLqAZHUltWG3n4hlV0l+JmR+5LPyew8Pri2v7r2kERo=; b=eBZZgeAfH5XgaGOiWk4f+9cJNh
 vmYCHExCpG3WuQUMQyVbxC0eN9dzlKhQujKJhX8tzJDUZjml03uJc1r0HgNE846KfXgXwQxwvS2Lr
 fMTBMy1qJR010IzEn1ltwOOkJMdClKW6biypRYCU4hmw8nm/IdE9x+TPo1puTMNPPCgJQ2hc1dwPH
 YUBVMzDI4G+EBjEhAe1lZvvS7amMt8zjP9sS6P8XDIQotUx0UzaY1prNvdmjMcfycMowL8Qr8E+dG
 EOrJPJkONHQv9u/fNoCsrCr+Ug5FfanwbOpDG8UOJ1j/VYFgq+Kcs7K7iPoC6OTJacZGbzBACJIUK
 IJdXsR1i6sf0ecTpt/yqE3lAleib/xS2DT2FD+3bPLIqIJrRZUrOHp2APFoUYy7d4xFjBflno1osm
 Tiu6qyWdA2eu16E6oCczkENxnFpn06OPCsvjqJyvSzp/e4+u6K0XbCPcJfJ0unEzDfvFrThsibqZ+
 QcLXXZnz5qD3SgNxwQqBDHsE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1lLlNK-0001vP-KF
 for samba-technical@lists.samba.org; Mon, 15 Mar 2021 11:27:06 +0000
Date: Mon, 15 Mar 2021 11:27:04 +0000 (UTC)
To: Samba Technical <samba-technical@lists.samba.org>
Message-ID: <3e6395be-b3e3-4773-9a62-9a4a98a8deba@samba.org>
Subject: Expectation around pydsdb's dependency on libdnsserver-common
MIME-Version: 1.0
X-Correlation-ID: <3e6395be-b3e3-4773-9a62-9a4a98a8deba@samba.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Anoop C S via samba-technical <samba-technical@lists.samba.org>
Reply-To: Anoop C S <anoopcs@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I see that with [1] pydsdb is now being built without AD DC. In our nightly=
 master Samba builds we noticed a dependency failure[2] while trying to ins=
tall these new .so files after including it in a python3-samba rpm sub pack=
age.

Install test reported a dependency on libdnsserver-common-samba4.so(for pyd=
sdb) which is only installed with AD DC and fails in its absence.

source4/dns_server/wscript_build has the following:

bld.SAMBA_LIBRARY('dnsserver_common',
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 source=3D'dnsserver_common.c',
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 deps=3D'samba-util samba-errors =
ldbsamba clidns',
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 private_library=3DTrue,
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install=3Dbld.AD_DC_BUILD_IS_ENA=
BLED()
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )

Was this intended while changing pydsdb to be built without AD DC? Feel fre=
e to correct me if I am wrong.

Thanks,
Anoop C S.

[1] https://git.samba.org/?p=3Dsamba.git;a=3Dcommit;h=3Da7897cc6cd5ba2df57d=
354c71b625e98be2a3243

[2] https://ci.centos.org/job/gluster_samba-build-rpms-centos8/28/console
