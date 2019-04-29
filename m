Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F82EB2F
	for <lists+samba-technical@lfdr.de>; Mon, 29 Apr 2019 21:52:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=e0UK7h1bHOKLNaWR+jqTFwNRYPnJIc6g8LxosMOEO/Y=; b=wVo2XGjB3PnTXg4SfgYva2woBi
	n2rCDcozb5H4/eQW3ipq5ST6o+NmgiOKSgkNxCwlFCHmi8NKvT5n3h/nzkoKOBKMsWJ6uq4R0sHF7
	bgSKZLfp8ZbI6C2FXFt752VzDp/7Jv5SuSC1kma7qnb2J06NNWp3o95lZBF+/hNByFbZOxgm7hSdP
	rwqIEM7zrrpn6tGneTlGiW53eNgUcYdJkg2RckEfrMWTH9Ztn+itZ22oJwogFzlCr+JO0myReV2dh
	8CBZ9PxaeV7/MuumgkuLN75AErdALhboxTw7YdJam4nIL9ILu10RsLrymM+0s1pgEzhE5pPfa4PcV
	KO1SYYJw==;
Received: from localhost ([::1]:49872 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLCJo-003jyR-OZ; Mon, 29 Apr 2019 19:52:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:20310) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLCJk-003jyK-J9
 for samba-technical@lists.samba.org; Mon, 29 Apr 2019 19:52:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=To:Message-Id:Cc:Date:From;
 bh=e0UK7h1bHOKLNaWR+jqTFwNRYPnJIc6g8LxosMOEO/Y=; b=tMTIAqWUf0xJJ5spK82A4Z9Tja
 UjM2xTVi4HR5RloiQltpzrSAvNAh/a07BopSvRS8t9pm/K9efrd3iHgdYytMzLto7kZtIJi30+QSA
 jx+gJ5guabgUYbYbMGsQov+HHwlDz0a8o9N7Y3/menQCB0fXA6Ax3dtAQD5FVo7cHPb4=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLCJd-0008Rt-Uy; Mon, 29 Apr 2019 19:51:54 +0000
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Re: [PATCH] Revert "wafsamba: Enable warnings for missing field
 initializer"
In-Reply-To: <20190429193555.GA28948@samba.org>
Date: Mon, 29 Apr 2019 21:51:53 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <634FD7C2-DD12-4714-9AE8-A95BD3EF40E9@samba.org>
References: <20190429193555.GA28948@samba.org>
To: Christof Schmitt <cs@samba.org>
X-Mailer: Apple Mail (2.3445.102.3)
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: =?utf-8?Q?Ralph_B=C3=B6hme?= via samba-technical
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?Q?Ralph_B=C3=B6hme?= <slow@samba.org>
Cc: Andreas Schneider <asn@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hey Christof

> Am 29.04.2019 um 21:36 schrieb Christof Schmitt <cs@samba.org>:
>=20
> Revert the patch adding the warnings since that causes problems when
> compiling master on RHEL7. Many C99 initializers of nested structs are
> flagged as problematic, so it seems easier to remove the additional
> compiler checks.

sorry, didn't thought about older compilers...

Can we have a compiler check that ensures {0} works included with nested =
structs and then only enable the -Wmissing-field-initializers if it =
does?

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


