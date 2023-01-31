Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A84682FB0
	for <lists+samba-technical@lfdr.de>; Tue, 31 Jan 2023 15:50:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=BRpALLfRnh+cNSpkEyjM/TYV7eoRQqtpJWjzxb1c69A=; b=x51gbq5gBnlttzzMyw0y0M65iq
	pxsu+mddBK9r1BjrGZ34oQzDV3V8ifI9hGxDIuIZaU+XNgRm0GK5fRYpK8sC1Xp3hn/tQw7DGMH5Y
	+iO+7w2C2I8MEK/r1kKzsklZWp8cyYy50Jtt4aYNAwBDG+wVvat7eTh9oyBxXPDMl0l0gYNinoBAW
	o2nJjQ6zM2Cs2XLYpCGGin1HnkWKMN84JTbkj2ZbdxO/KlaThbDsGJunohfffPadnKWMrSSlc8bSq
	blPbye7GjFl7VEYdojSkGs5XzZc58uBdfLV45OlLTloN07X9Cg2UQMWs/SLFMji9nUJwySmzFZDDm
	NWx7sOOQ==;
Received: from ip6-localhost ([::1]:39792 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pMrxC-00546e-Nn; Tue, 31 Jan 2023 14:49:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55754) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pMrx5-00546V-NU
 for samba-technical@lists.samba.org; Tue, 31 Jan 2023 14:49:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=BRpALLfRnh+cNSpkEyjM/TYV7eoRQqtpJWjzxb1c69A=; b=qgWvRpbklN/d4QmuyWwpiMunc+
 0StWLvEFDV5Fz08xjktfcH/I2MBzt/RcMv4N+ZfLNFehW6wkoLwOBkQ8Yudtyj+oFj/l6f0Z7QZZ1
 2tcK3II855GViNXZolkEXg7RgwRhjpaZ0wv6hIF/w5W2t0b74eVITYdut/A6AlrZ5XdbD/EoTNBta
 3QMJejAek9no3Rb0mc4JfsyWagv9sh4EWfZka1rFv+3HB5Gw4i5mt03g5KZgWb6x2GFYfpEOSEcdn
 DkyhloIW+Ax9VfXf3yfIZw1ug8vBujBLvxMznfbryNShtlGseZcU0X1NPJF7rOa1YcxzWbloKYWm6
 bMQEevIcIlyhi64dpmOfxpX4R/uYBmYpHb8S2YkTLaONUEEgDghxdkA1Icy7ox8MhPaULkMRj6nNC
 R08KyPMJfJQr8jSPKx09C1KamPLVcwIlol4LOiD5vQ4XcwG4tVB8HyCz+3ZzSA4e+xnMfY5BUQUL4
 axp/wtlSvuheOwpUM6FWyZun;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pMrx4-00B5S4-Ji
 for samba-technical@lists.samba.org; Tue, 31 Jan 2023 14:49:38 +0000
Message-ID: <e0eb8658-8c7f-b270-df2e-c19bfa5c9841@samba.org>
Date: Tue, 31 Jan 2023 07:49:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: problem with GPO Policy after rename
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <3E14DFAD-1094-4089-8897-88AF7CA133EF@grown-up.com>
In-Reply-To: <3E14DFAD-1094-4089-8897-88AF7CA133EF@grown-up.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: David Mulder via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Mulder <dmulder@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 1/30/23 11:46 PM, itdept_head via samba-technical wrote:
> Samba 4.14.4
> Migrated a domain. with a  Rename.
> The domain is up and resolving correctly and logs in etc. (seems to function totally correctly)
>
>
>
>
> As stated in documents the GPO point to the old domain.
>
> Old: ns01.Jim.com
> New: org.bob.com
>
>
> However this hangs the windows 10  gpmc.msc tool.
>
> Forest: org.bob.com
> Domains: org.bob.com
> org.bob.com
>
> as soon as you select the “org.bob.com” to maintain the tree of users/gpo ,etc you get into an endless loop since  “ns01.jim.com” cannot be found (also you might not want it referencing the old domain)
>
> “Domain: ns01.Jim.com”
> “The specified domain either does not exist or could not be contacted.”
> This then puts the MS tools into a tight loop with no cancel options.
>
>
> QUESTION:
> Where is this reference to  “Domain: ns01.Jim.com”. kept in the LDAP.
> Totally deleting the GPO from SYSVOL AND  going into CN=Policies.CN=System. To delete any used GPO links ,  and restarting the  samba does not remove the references.
IIRC, these are kept in 'CN=Policies,CN=System' in ldap. I think the 
objectClass is 'groupPolicyContainer'. I'm just skimming through code to 
see these. You should be able to do a subtree search for 
'(objectClass=groupPolicyContainer)' to find all your GPOs.

-- 
David Mulder
Labs Software Engineer, Samba
SUSE
1221 S Valley Grove Way, Suite 500
Pleasant Grove, UT 84062
(P)+1 385.208.2989
dmulder@suse.com
http://www.suse.com


