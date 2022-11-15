Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE4762A24A
	for <lists+samba-technical@lfdr.de>; Tue, 15 Nov 2022 20:56:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=vNwX+Y6ZXvfHvGDvj/7/cKkwMYgrpV+9PKj6ztMBDmc=; b=mFirnRo/1K9D/OJl5V3gG3RZwh
	kdeLGlFfYoGbQP4OmBUuSa6mN1w6aZsRvSRjRfcAu8WIdj6EogSXS02V9upYa4NyOZBQL/BHkZoC4
	VvMx0cQPcoVLj/rHNq8k/97nt3tYxqjNntYSnEbqItzbib1E1jen/wOlXIQ0FdSU2vXxpwqAqVqOG
	3fGe85Vu8SSkOMu5jgnTtT2ctXm1JLzT4L5Rz0u2N3+6e/aCK6XkMgkqsLGQi+fBoZxl/8jGMv8og
	72AKxh4ZIisvk1kLhnCJtFla+hF/K0v7o5YVzuo7FfmXl5A8uQAORwug75jz9liYci4HhRpxb+8iQ
	pBW6AAIQ==;
Received: from ip6-localhost ([::1]:18102 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ov22I-00E0Eg-Dk; Tue, 15 Nov 2022 19:55:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46344) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ov22C-00E0EX-Vu
 for samba-technical@lists.samba.org; Tue, 15 Nov 2022 19:55:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=uMyIY9FIUlSzugH5hN9nmYeaB7PGhKuv286n2Bu/GSA=; b=LWFZkLR9Qa9rMQT3/EIeP7Kzlu
 G46svZUkhgZwTatXwTw5qdTZyAMrJgVPD+NUnREf9L0ZAIU7snj0D60widJLcLbajd+ptZD9SnwGN
 q8SSHDrc89s/L7qJTizBhbHzNRQQ8jWsdBt56YxRMJ5moJxUk9Nq7cLZ9TuUYCXC22G69+qFP7nzR
 Eh+Pq9IN9U/+DRwmK6Mg4ZEBjZyMAP6Ba5xpUBZKFoqQGArKnix4y0JTkrg7T2vy28Iz3x0CA4xQe
 1eE4XBve/R2Rj3M2FYtac8L6jxV7loj2cbtyL0o4tIExvdksc+1WiG3w1Wc+QDtelhWozEEzUh1/i
 k0dYODYNCsJRMidgF5yx10cNiX2XIAEyU+KmOXNZ2PPkNfPnLVDbZThmNmuk6g+bRe3BKMgN57yMj
 M733MfDbXiu/GKlcPdmOCb+oHmSdue0n6oRbuteYO0Uty4Q3qIZDmXAYqrxLGfAHXkv7i0nKLkFeO
 eiiybyrtyU19wMBABBKPWFIZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ov224-008lH5-0x; Tue, 15 Nov 2022 19:55:44 +0000
Message-ID: <dfe303b159abda7d7be912def29bec18cc2f0dca.camel@samba.org>
Subject: Re: failing tests in the testsuite on debian
To: Michael Tokarev <mjt@tls.msk.ru>, Jeremy Allison <jra@samba.org>
Date: Wed, 16 Nov 2022 08:55:40 +1300
In-Reply-To: <1f00b2cd-2368-b6a5-ef70-b917dd42794c@msgid.tls.msk.ru>
References: <4197c161-ef1e-3710-f50e-7631ddaf5f3f@msgid.tls.msk.ru>
 <de87d255-95d0-ac34-1544-fa0aac441f4b@msgid.tls.msk.ru>
 <66781199-ab84-1c05-3224-ed65cb9b12bc@msgid.tls.msk.ru>
 <Y3PPjghJzwYBPlAN@jeremy-acer>
 <1f00b2cd-2368-b6a5-ef70-b917dd42794c@msgid.tls.msk.ru>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2022-11-15 at 22:52 +0300, Michael Tokarev via samba-technical
wrote:
> [35(230)/370 at 58s] samba3.smb2.session enc(nt4_dc)
> UNEXPECTED(failure): samba3.smb2.session enc.reauth1(nt4_dc)
> REASON: Exception: Exception:
> ../../source4/torture/smb2/session.c:247: (&io1)->out.file_attr was
> 128 (0x80), expected 32 (0x20): out.file_attr incorrect
> UNEXPECTED(failure): samba3.smb2.session enc.reauth2(nt4_dc)
> REASON: Exception: Exception:
> ../../source4/torture/smb2/session.c:323: (&io1)->out.file_attr was
> 128 (0x80), expected 32 (0x20): out.file_attr incorrect
> ...(many of them)...
> 
> 
> this is ATTRIBUTE_ARCHIVE vs ATTRIBUTE_NORMAL. The test is
> expecting the newly created files to have "a" attribute but
> apparently there's none. Just a thought here - maybe it has
> something to do with this user being unable to create extended
> attributes, or maybe tmpfs (where I run the whole thing) does
> not support it.

This is it.  Samba's testsuite (at least some aspects of it where we
check by proxy filesystem behaivours) is not compatible with tmpfs,
unionfs etc.  Use ext4.

Andrew Bartlett


-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions





