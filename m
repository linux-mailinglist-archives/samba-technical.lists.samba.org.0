Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B1827163EF1
	for <lists+samba-technical@lfdr.de>; Wed, 19 Feb 2020 09:23:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=M1skcuZYoNBrb3ZJfr8KjsPgLnHwE9y4kVeqe9tEV6M=; b=WSQ0C+Ajbni+bax815Pn//i+lN
	JjJshgQ4j1hXuLFOiygwmQUyTu/zQtmd/auxcm4Gg72Hw3feCrImtXaqXoyY5mk0e0RPUcLX7h+rV
	X5alB2iMHYWVL+ipt1t17Yb2kU9jTab75UAQq8qSokfGjcX5qUIw91WfLqzl+mvoepldkQAtJkB6a
	S35kRkjJqGQD4biClO0tK1TgEkCg8piY4gCMyGJhUDASqkDig6B064qDcw3Wfcyzicjaa2iyD3OP5
	5Xz+eNlC93CVKBd28y54h9HARaNjGLYpbUCUf9i0rGCzQVcdYnmrAjFOvGFephHsKXHKLRYIspeC6
	FX7FUf2w==;
Received: from localhost ([::1]:52892 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j4KcQ-00AVbY-3B; Wed, 19 Feb 2020 08:22:06 +0000
Received: from a2-128.smtp-out.eu-west-1.amazonses.com ([54.240.2.128]:60176) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim) id 1j4KcL-00AVbR-8r
 for samba-technical@lists.samba.org; Wed, 19 Feb 2020 08:22:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=gtiefq4aqa7w67wwqysvtccq4xrjnbj5; d=aaton.com; t=1582099912;
 h=Subject:From:To:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id;
 bh=M1skcuZYoNBrb3ZJfr8KjsPgLnHwE9y4kVeqe9tEV6M=;
 b=ZPq8r2Mk/MUWnRIkJt8+TPOdPJ0bzYURZqJOYrLl3tyZkLQ0QfY/VjfqbGEF0ILL
 wWNEEJzS/45OVWQqxJxfNrm12yDZ/pnK0OEZ0ccYsdjVVOaAkFIDrq2ttK5giUXH1jk
 F+vhibbxM3S/D/y9KlRJlfeQ0CAtja5jFKgy+mA8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=ihchhvubuqgjsxyuhssfvqohv7z3u4hn; d=amazonses.com; t=1582099912;
 h=Subject:From:To:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id:Feedback-ID;
 bh=M1skcuZYoNBrb3ZJfr8KjsPgLnHwE9y4kVeqe9tEV6M=;
 b=d7WZKQYJ5PI4WEf2G1Zu6Fj3qcmYDMTmv119godlU6yUqWTuHD/XjJX1QzaGE2DN
 pq3ZNcwl3CptsUDq8oRs/iBny8HSc7U94LyycTG0ScCkRXLXwrrGOy1cMgDXLcFQXhv
 yotB76zcv2JgE9CqCHvzMIYdTGUKJ8hqT3i5LzG4=
Subject: Re: QNX6.6 cross-compilation problem
To: =?UTF-8?Q?samba-technical=40lists=2Esamba=2Eorg?=
 <samba-technical@lists.samba.org>
Date: Wed, 19 Feb 2020 08:11:52 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7dcdcb8bc691012aba2de432563586575de2d995.camel@samba.org>
References: <7e220de2-1a52-02a8-ba8e-2fc963fa7699@aaton.com> 
 <116a320e-62d5-b51e-0b0d-7c0709237d0c@samba.org> 
 <51f6d175-d856-0d59-a19b-ee326066fae5@aaton.com> 
 <0102017053b6e994-c1f3f196-af94-47c2-914e-427291dbc480-000000@eu-west-1.amazonses.com>
 <0bfee16342064a00ce1b69edc9a1560f4f23e16e.camel@samba.org> 
 <1bce721f-c5d6-ab32-1e5a-167741775092@aaton.com> 
 <0102017058ba17bb-c855beaf-ff0f-4652-9716-c1c5c6995aa9-000000@eu-west-1.amazonses.com>
 <7dcdcb8bc691012aba2de432563586575de2d995.camel@samba.org> 
 <8c54e707-d0cd-7342-7133-045fb56f9b1a@aaton.com>
X-Mailer: Amazon WorkMail
Thread-Index: AQHV4xePtgTlttjWR2av2pbvb72egAAVIUorAKNXpGIAp1Jp9QDUSp1pANuccSIA+SuEQw==
Thread-Topic: QNX6.6 cross-compilation problem
Message-ID: <010201705c80d555-ed94ec9c-da21-41d0-8ba2-6fcb9e59327b-000000@eu-west-1.amazonses.com>
X-SES-Outgoing: 2020.02.19-54.240.2.128
Feedback-ID: 1.eu-west-1.b24dn6frgCi6dh20skzbuMRr7UL8M6Soir/3ogtEjHQ=:AmazonSES
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
From: Nicolas Pinault via samba-technical <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Nicolas_Pinault?= <nicolasp@aaton.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Andrew,=0D=0A> It looks like I have to cross-compile gnutls for my system=
=2E Right =3F=0D=0A> Yes, GnuTLS is a requirement now:=0D=0AAnother great=
 challenge ;)=0D=0A>=0D=0A> https://wiki.samba.org/index.php/Package_Depe=
ndencies_Required_to_Build_Samba#Mandatory=0D=0AWhich ones are requested =
on host and which one are requested on target=20=0D=0Awhen cross-compilin=
g =3F=0D=0A=0D=0ANicolas=0D=0A

