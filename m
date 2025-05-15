Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C91BBAB87E3
	for <lists+samba-technical@lfdr.de>; Thu, 15 May 2025 15:28:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=tFQVgemxlguMsLyfkT7jwmOizaH5IapZZM7FdmSDgWw=; b=HHvbgVWohraSKkVq4pod44NnD6
	KNtFVEhNbo1N0d34HxjIkQ6RY+ktaS7spwzitkeoxjMJbP+bFTQt5mYK4+3GrzI4wB2ha2oihtNTZ
	s/5l31yLBk9l9ltoF4Wl1wsI7p8GSK0Bjn8ZGupuukqhlU2suRtimcWJ/yG6FWZjUMBMNjXkkRMpw
	XwhxY0kcw/5NjXk7/NcNdXySFR7GnGtuNNelLmSOCLBdAl7Xe6kHrZPtjcYh06Qw1T0YqCurXIKBv
	EdUTP9dfHmuA5OZy0yvm7D95i5CqxugPu+CCumWiGGUxa+FPy+Qb/yN1sTfHX7loRInTIoCm7/qyW
	LIULDUoA==;
Received: from ip6-localhost ([::1]:42250 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uFYct-003ca1-JY; Thu, 15 May 2025 13:27:55 +0000
Received: from relay3.ptmail.sapo.pt ([212.55.154.23]:46844) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uFYcm-003cYv-2b
 for samba-technical@lists.samba.org; Thu, 15 May 2025 13:27:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapo.pt;
 s=sapo20240325; t=1747315736;
 bh=tFQVgemxlguMsLyfkT7jwmOizaH5IapZZM7FdmSDgWw=;
 h=From:To:References:In-Reply-To:Subject:Date:From;
 b=D+QciaQYUC6eRm8jM2CMArIyNWUAbyg90WTLjUMlX9RjrUFv6wf4kpzsJkL6hVEvx
 DNVDFtyqIQ7nE/p8Vl5/2CRG49iNcVaIw2pVqnF0/a9OpFQXcBhd+MnLiPHlFwZmik
 JK+2cZQydygkPTm0+b0cEaSMEVfCLn8gx6ZHBVALr9ZokfPD/7kNzuUbte6MPZ+pay
 Z9WbkShifG3lT3ZMKhv5g5pKniFXUEY610wYieObLGflpdP3rNP0U14epknRTi2JsL
 ePnFDyHgvFEKDrMIQ2tBW9Ffg/zUcsvsdncIbOB7ul6pV4JHS55wmgTMpBEo0yhEoC
 kuzhUyENOn3zQ==
Received: from sapo.pt (unknown [10.134.36.75])
 by relay3.ptmail.sapo.pt (Postfix) with ESMTP id D0F13B561AB
 for <samba-technical@lists.samba.org>; Thu, 15 May 2025 14:28:56 +0100 (WEST)
Received: (qmail 3412755 invoked from network); 15 May 2025 13:27:45 -0000
Received: from Sepher3 (unknown medalist@sapo.pt@[85.245.190.191])
 (envelope-sender <medalist@sapo.pt>)
 by ptmail-mta-auth01 (qmail-ptmail-1.0.0) with ESMTPSA;
 15 May 2025 13:27:45 -0000
X-PTMail-RemoteIP: 85.245.190.191
X-PTMail-AllowedSender-Action: 
X-PTMail-Service: default
To: <samba-technical@lists.samba.org>,
	<samba@lists.samba.org>
References: <00a801dbc59a$3f93d510$bebb7f30$@sapo.pt>
In-Reply-To: <00a801dbc59a$3f93d510$bebb7f30$@sapo.pt>
Subject: RE: "netbios name" parameter
Date: Thu, 15 May 2025 14:27:38 +0100
Message-ID: <000101dbc59d$20eb9910$62c2cb30$@sapo.pt>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Content-Language: pt
Thread-Index: AQIvbtuLrozxWnzXqj7Ii0BjkuFic7MsXAJA
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
From: miguel medalha via samba-technical <samba-technical@lists.samba.org>
Reply-To: miguel medalha <medalist@sapo.pt>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> With the obsolescence of NetBIOS, maybe it's time, for the sake of clarity
> and precision, to introduce a synonym like "short host name" to the
"netbios
> name" parameter, which would eventually be phased out in the future.

> As it is now, the "netbios name" parameter is the only way to refer to the
> short form of the host name, which doesn't seem to be very accurate
> nowadays...

> Lots of other Samba parameters have synonyms, so why not this one?

In the same manner, for the sake of consistency, maybe the "workgroup"
parameter could have a "domain name" synonym.


