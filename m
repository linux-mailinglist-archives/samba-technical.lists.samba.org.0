Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E048CAB87DF
	for <lists+samba-technical@lfdr.de>; Thu, 15 May 2025 15:24:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=w1gbys1go/t+AxyTuVgrf40QH4x8usX58URw6/hcfko=; b=RaPfXl2B20KXT7ye4Cf4Tm2sqy
	1+YMO16jlJFBiVJz9+AaZEHNZWS3N+k+GuPH4+IhI04XDy4aUBBK+WSQXTk7gUwb/Bu8FH9soT3Z1
	ASUy/ksjhdaJ2NfCBul5I9wSGYIadQH1nhPtus5WH7OM3Zz1X9qGXZXxs2eFn9mEQHYPM7fT4wNJQ
	OHOd4TitOzzeTQWmboyMAYAGn8BDMKP6KvZmeYj1SrnUNNEe5/O2uuqBA1a3pxqfS2FrYPzK6EN/M
	K8u8tmbbPY0UnhGgOe94ubIkWznJ4ypwITA3yBo66HicY2Qn/+CLnO5YyZ+y9IuI5CEkfWGpMZm16
	5muDkCag==;
Received: from ip6-localhost ([::1]:52074 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uFYZ4-003cEE-ME; Thu, 15 May 2025 13:23:58 +0000
Received: from relay4.ptmail.sapo.pt ([212.55.154.24]:39422) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uFYZ0-003cE7-Ph
 for samba-technical@lists.samba.org; Thu, 15 May 2025 13:23:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapo.pt;
 s=sapo20240325; t=1747314503;
 bh=w1gbys1go/t+AxyTuVgrf40QH4x8usX58URw6/hcfko=;
 h=From:To:Subject:Date:From;
 b=MthGeYsUj0PY0DRz3NY8w9z2/HqFsB41i6KHuhKFrd/5VWsKZKX7LopenZS9Z+9T0
 EGMmNPHOUi4q9Tf6xm5uxqVUivyTs9xVzEnGqflODbTRpPoUyMaOKrmG03xVXR3PcR
 i2AgcJMav3y8MwEG5+pUCvjDeGg2RcdtGduognJJ5fDnarefsWI8RiVjc/uAYMWJqL
 HoNj0Sfw1cWIxqc2964zkTIhANFPDI6tDIdeat+eiPcgzwE+W13cz44W/bPt207wML
 QBW3jQfvnhjhvix1ripE2ZGCVfLkEBTI+0RGppCCgAsWaSm68t/crne25EZmCMieMg
 gcYPTnZhiw61A==
Received: from sapo.pt (unknown [10.134.36.76])
 by relay4.ptmail.sapo.pt (Postfix) with ESMTP id DB568B55E9D
 for <samba-technical@lists.samba.org>; Thu, 15 May 2025 14:08:23 +0100 (WEST)
Received: (qmail 703039 invoked from network); 15 May 2025 13:07:08 -0000
Received: from Sepher3 (unknown medalist@sapo.pt@[85.245.190.191])
 (envelope-sender <medalist@sapo.pt>)
 by ptmail-mta-auth02 (qmail-ptmail-1.0.0) with ESMTPSA;
 15 May 2025 13:07:08 -0000
X-PTMail-RemoteIP: 85.245.190.191
X-PTMail-AllowedSender-Action: 
X-PTMail-Service: default
To: <samba-technical@lists.samba.org>,
	<samba@lists.samba.org>
Subject: "netbios name" parameter
Date: Thu, 15 May 2025 14:07:01 +0100
Message-ID: <00a801dbc59a$3f93d510$bebb7f30$@sapo.pt>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Content-Language: pt
Thread-Index: AdvFmIcyhM8AkBuIRsaGZQE9yUU7Hg==
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


With the obsolescence of NetBIOS, maybe it's time, for the sake of clarity
and precision, to introduce a synonym like "short host name" to the "netbios
name" parameter, which would eventually be phased out in the future.

As it is now, the "netbios name" parameter is the only way to refer to the
short form of the host name, which doesn't seem to be very accurate
nowadays...

Lots of other Samba parameters have synonyms, so why not this one?

Thank you.



