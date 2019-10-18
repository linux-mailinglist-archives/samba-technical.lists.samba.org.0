Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F284DC7F2
	for <lists+samba-technical@lfdr.de>; Fri, 18 Oct 2019 16:58:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=I+degAFrzdGnAx4zBITta6LVqOBhneek4EiytLpOerQ=; b=qTBnRxNShFHHZ/TQbHJbOE9Ol3
	lyj0BzGRlJXFzEKGaZwW7wgG2aa+/TPf+PR2OsjDRDy354NxiW507oKdsx6r7AdN7d+G4l9cYxAxd
	15aC2OgP/iFA6jYUkskl3XJzwzmQA99rlNuc+ZuiCukJPN3K6MtI+XDopUXqgG2iQZDOoxvg4KdtV
	mpbAUUHVJhdqQ0AFPzhKOOv1CGtTe+vhfgpBdtsSi1p6pyRKYM8c796aGGmh8mC5Jvr9F97WZg+V4
	I/zFDrxoE7CXHrQ5ZWRWP4mT38SX07gujiQ9SA8vqRU82Zx5CTWwbh/HcguRUabXLkTUiBcV6PiNU
	m22ufoTw==;
Received: from localhost ([::1]:18562 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iLTh8-000KkC-9V; Fri, 18 Oct 2019 14:57:34 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:38088) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iLTh4-000Kk5-5u
 for samba-technical@lists.samba.org; Fri, 18 Oct 2019 14:57:32 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1572015448.59913@NzVaERZLT5m6G/90ToUYGg
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: BBB5D11F0E4.AA270
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id BBB5D11F0E4
 for <samba-technical@lists.samba.org>; Fri, 18 Oct 2019 16:57:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1571410646;
 bh=wnhrqD5V4Tazz+aTdJ9GP90pAttyIhsUqBv+abmq8Hc=;
 h=Subject:From:To:Date:From;
 b=mm5l9d9Eaqm0+aa8PtI7zR6Py7mJSucKz6dnVclVfO8ZFJk1XPGMmSjOYCIz88w4T
 /439IZQ6tHlxXFjOF0OfGYjdI3CJcDjCEl8SsG4QWVLV0AMTl5AAub8hwTbFJ9xOsn
 kRMGvaWmcM3ANCgY+CKVGtUidNTKsOwVJvAoXH5+Hudp0M6+hCTkXPQpqHRs+k03RQ
 xvWEAKl3hNArQxlaES31slrZZdohJDlPO/ME9zFGEHAZpHl938tq4jRhUUsQ3GI68T
 R0kF4d3CJFin7kM60CRQrctbkt6KBbtT8N3nWSXd1fmRJx1wtBk6Rkz8KN7NeqsaYn
 RbRXkUlJA7kgg==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id 30ED33AF8C
 for <samba-technical@lists.samba.org>; Fri, 18 Oct 2019 16:57:19 +0200 (CEST)
Subject: Building on armhf
To: =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Fri, 18 Oct 2019 16:57:19 +0200
Mime-Version: 1.0
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AdWFxFZIw4BkokK1SC++G8wOYNvDpw==
Message-Id: <vmime.5da9d2cf.67ea.2e47a9a962d3963f@ms249-lin-003.rotterdam.bazuin.nl>
Content-Type: text/plain; charset=windows-1252
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
From: "L.P.H. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "=?windows-1252?Q?L.P.H._van_Belle?=" <belle@bazuin.nl>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hai,=20=0D=0A=A0=0D=0AJust a question here, is there a way to speed up bu=
ilding for armhf.=20=0D=0Aim already using ccache and tmpfs but the cpu e=
mulation of armhf makes it so slow..=20=0D=0A=A0=0D=0Aim using qemu to si=
mulate the armhf env.=A0=20=0D=0A=0D=0AWith the current build speed=A0tak=
ing me hours ..=A0 :-(=20=0D=0A=A0=0D=0AAnyone suggestion to speed this u=
p or is it just impossible due to the cpu emulation.=20=0D=0A=A0=0D=0A=A0=
=0D=0AGreetz,=20=0D=0A=A0=0D=0ALouis=0D=0A=A0=0D=0A
