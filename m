Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FD99B3DB7
	for <lists+samba-technical@lfdr.de>; Mon, 28 Oct 2024 23:27:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=GsOZ/XthbLbpZtwBXMLHCMdVHlbAXyZByxJwsoTV3fY=; b=ZvKBf9xJ0XLMkClijpL6egrBnf
	JXoXDFGSXK8aK5pIM3XBVIzw/F3DgLjTGnOAygi4ce32jK1UtIeeYGcOMmNy+BPO86FZ6iKVaGQLc
	MRpuPRnlR9yyI2yw0Ibpm9qfQp6uqC0D4ADOtedg//SK7qnKL0S8PPOVv7Tv4kxGvAy483NuxQDP3
	dMPag1mC/splI5wc0CmwOWmuem6JJfAIWVb0u1etWWBltOriqDGzHTYHPD7xe1Zd++9isClZRYF46
	XHtTdZoXakiK7hUZcSD/wE+6CQjv7Gjo0n/uTPaoBXFD5Cc+Wf7ycqgi/p/tlD/rJQhsqv6B0V7ez
	k14agIBQ==;
Received: from ip6-localhost ([::1]:61910 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t5YCc-005Oph-AB; Mon, 28 Oct 2024 22:27:10 +0000
Received: from cat-porwal-prod-mail10.catalyst.net.nz ([202.49.242.1]:40968) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t5YCW-005Opa-PB
 for samba-technical@lists.samba.org; Mon, 28 Oct 2024 22:27:08 +0000
Received: from [192.168.1.219] (unknown [114.23.142.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail10.catalyst.net.nz (Postfix) with ESMTPSA id 4ADAF6DE; 
 Tue, 29 Oct 2024 11:26:56 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=catalyst.net.nz;
 s=default; t=1730154416;
 bh=pi5HGZJDZyvbVUpYmlb9BB5OmJVbI0ZRM00zLYM9a+g=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=scdmGelQ6SJn0QqG19t+AU0PoKInzRLsX1phWwP78HGD+J19o85rcNCseI/om6hx7
 504yR5x+EVyM/+S0Q4aWeUuQXvS8GY1aR6siUTiOi4h+ym1fs/X4pZzyPvLHH/9r9R
 WiJnwaA93jar5pQscjvvdfnkLaN7BoriMotKdQKcw8JFJfJM1j5S0RFfwerFtViCJS
 QtCorEf2ZMGyG4CyyUNzZ09eXreN8TeZmxG0BVY3MfO5JI3stABF084+80CyK+D1WG
 11ceZNO/SwGdgVflKGPdEJi6izZsNbvho4euF9htU3dMO+mbU3EwaYlnsp1n95572o
 NK72lkvw3I0EA==
Message-ID: <0f4e2d3b-12b2-4dfc-88ef-0b52c12bf6db@catalyst.net.nz>
Date: Tue, 29 Oct 2024 11:26:54 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: authentication policies in Samba 4.21
To: Stefan Kania <stefan@kania-online.de>,
 samba-technical <samba-technical@lists.samba.org>
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <297faa9c-6788-436b-bfb3-8d2107b8596d@catalyst.net.nz>
 <48c2847c-7d05-4e1a-9e85-52b1ba5d0b30@catalyst.net.nz>
 <ef60d0ef-25df-4081-9764-5dbc05bfc655@kania-online.de>
 <1eb80efc-4bb2-4b7c-b339-5b92277e782e@samba.org>
 <49b4b9af-033a-4534-90e3-ac633ff8bfd8@kania-online.de>
 <7bf96a40-7472-47ca-b81c-7e9121c598b4@samba.org>
 <68fe1182-281f-42ea-ac18-b0a2bf49961d@samba.org>
 <afa75a49-2ae4-4e14-9363-d5c31d7ef2a9@kania-online.de>
 <b5f3c39b-43c8-4b43-943d-cd851128173c@kania-online.de>
 <5d10619f-c4ed-4190-a4d1-1cec480ee108@catalyst.net.nz>
 <c420e24b-562d-4592-a9df-d0dddd069e22@kania-online.de>
 <ab589c2f-f13b-4560-bd18-7a1e88634a0d@catalyst.net.nz>
 <1a14a7d4-3d56-4212-9420-0affed9ffd18@kania-online.de>
Content-Language: en-NZ
In-Reply-To: <1a14a7d4-3d56-4212-9420-0affed9ffd18@kania-online.de>
Content-Type: text/plain; charset=UTF-8
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 29/10/24 02:29, Stefan Kania wrote:
> Starting from the beginning. Set up the Domain with:
> samba-tool domain provision --domain=example --real=example.net --host-ip=192.168.56.21 --backend-store=mdb
> --dns-backend=BIND9_DLZ --adminpass=Passw0rd --function-level=2016 --option="ad dc functional level = 2016"
> 
> Create some users and groups.
> 
> Then start the show:
> -------------------------
> Creating the two GPO
> 1. default domain controller policy
> Setting  KDC for claims

I'm not actually sure what this part does (which is normal for me and GPOs).

> 2. default domain policy
> Setting Kerberos for claims
> 
> 3. All steps to create the auth-policy and auth-silo and assigning the policy
> samba-tool domain  auth policy create --name win11-policy --enforce
> samba-tool domain  auth policy modify --user-tgt-lifetime-mins=90 --name win11-policy
> samba-tool domain auth silo create --name win11-silo --enforce
> samba-tool domain auth silo member grant --name win11-silo --member=stka

At this point you should be able to see the silo claim in a new kerberos ticket,
using `net ads kerberos pac dump  -Ustka`.

> samba-tool domain auth silo member grant --name win11-silo --member=WINCLIENT11\$
> samba-tool domain  auth policy user-allowed-to-authenticate-to set --by-silo=win11-silo --name=win11-policy

 *computer-allowed-to-authenticate-to

It would have been better for us to name this

  allowed-to-authenticate-to-computer

but I guess we are following the object names from Microsoft.

The rest of the trouble probably follows from this.

If that's not enough, we might need to look at

ldbsearch --url=/var/lib/samba/private/sam.ldb '(|(CN=stka)(CN=win11*))' --cross-ncs

cheers,
Douglas


