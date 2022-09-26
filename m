Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 266D65EADD5
	for <lists+samba-technical@lfdr.de>; Mon, 26 Sep 2022 19:14:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=3ECyG5crsil2ppjPI06ufRc+Zw76otfnUBGbIxbeYKM=; b=nNPrsfAFdFX0EXeAD3gH8krWeX
	rxqbAOO69RH424OPQTyhTYbfwttaP+hXRrbDZr3jMgxvyYNpKY04t4zwSneNbzMTz1uk/YwFXckgh
	qnI+IhnGGCDWGNWov+UhcY6xVb6QT5AcLaQIOQNnMd49At+ijdVpn4Cl0Xzx4xp4EIe7x2Q3t9fjT
	lqbB3TFU+ubu02eoUuCAt16yOvdwGmHockkyzitLytj1x2bXOF1rVHSh/FDRZz72ndqHJc3q1l/sc
	dkZT+jg9+mbWUq6XBHZDCkxyV9M+WmK7ZxSuWNXuEEbmGs0nAs/iXcAFP9Nvb61Cmc0nfcJzwOOcq
	acs6Kgpg==;
Received: from ip6-localhost ([::1]:55218 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ocrge-004HCM-Ob; Mon, 26 Sep 2022 17:14:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61584) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ocrgZ-004HCD-Mp
 for samba-technical@lists.samba.org; Mon, 26 Sep 2022 17:14:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=3ECyG5crsil2ppjPI06ufRc+Zw76otfnUBGbIxbeYKM=; b=w1CqW4HfJPDPzYwAYSqKC/Qaxa
 SCi0CUFbYRQa/P1xYBteGMqwrhdYvl2ycRtIRu7YrlAgF0m2NqFZ1RF8PReUCM1pRfZmsQYOkEMGM
 Eb+8K7PQ3CXGVlcYcGvyb/8cpzLYMvQdHmcF43KSS4EnKWRvjQqFxNeZPQjkEd2dnvQf0IBHWuour
 xVvwrP/bJWlJCDcFO4KsXNHnZJm3FGMpmvlc6fWpL9x6ZBr/CiVUkckQjzqK1qC/Jk0KlR9WLtsj5
 Z1WhnMVdelznVRg4tiomFoAVPxFpMelsLco7//RKYMh/r2myBh7Tp2SOrBCKbj/FhdriFQIzUsmwn
 9q3jr0U5/hImArLu/iYDelGaqLdjXPds8z/fYo2XS6M+eb+rQw8nz44QmXHixrVp/T3jW3DY7xYXx
 tPf06mjNjUaA4VVOBca892OgzWaC75A+yHIpoZSOm/Dfbyj279cDaayx9oC0EeWx/9ANFnARnyxr8
 XLYd72jVE8OlTRvd+eY6UJRS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ocrgY-001zb5-94; Mon, 26 Sep 2022 17:14:26 +0000
Message-ID: <eb0a59e3-6f29-4059-8278-2eca8a57c5da@samba.org>
Date: Mon, 26 Sep 2022 11:12:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US
To: samba-technical@lists.samba.org
Subject: SMB3 Posix Setinfo class?
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: David Mulder via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Mulder <dmulder@samba.org>
Cc: Steve French <sfrench@samba.org>, Tom Talpey <tom@talpey.com>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Currently I've defined in the smb3 posix spec a set info request to use 
the FilePosixInformation class defined here:

https://codeberg.org/dmulder/smb3_posix_spec#2-2-34-1-fileposixinformation

I noticed that MS-FSCC (section 2.4) defines different info classes for 
set and query.

It seems to me that FilePosixInformation, as it's currently defined, is 
better defined as a query only class. Most of the attributes are not 
modifiable via a setinfo. I think we should define an additional info 
class for setinfo, allowing you to set POSIXPerms (any other attributes 
make sense here?).

Either way, I don't think anyone has implemented setinfo for 
FilePosixInformation anyway (it's not in Samba at least).

Thoughts?

-- 
David Mulder
Labs Software Engineer, Samba
SUSE
1221 S Valley Grove Way, Suite 500
Pleasant Grove, UT 84062
(P)+1 385.208.2989
dmulder@suse.com
http://www.suse.com


