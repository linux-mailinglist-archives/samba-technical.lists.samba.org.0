Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2779C9B6C31
	for <lists+samba-technical@lfdr.de>; Wed, 30 Oct 2024 19:34:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=EzZJZSjd4OKSSTfU/Sui21RXG+9LnOTn7K782GU6DBk=; b=qNHaW05o7fFMzmgeufrinfWxZU
	nMRH/ydQVxmbE2u020a8H2rtFqiglCAR7aUPzV3T1GbM862oogVTF/OWQEGGImwxVuIqG/8dqwT2F
	gslE2wcUlPpS+cCji4iq2SZ6DdFgcU5/ZxHyir0dIMPrArxArKNAIVehJkHE14sjF0fxIFq0AI0Wn
	p7RvH64brmLWBgeRsfMmbUu7La928u1L6P0zm3Ey2OfynlNfQRQ/iPiCGyoGuFWxa6QkjGu/fZLmi
	Ix+UhCm9xXi8j5w5Jt0tZ3AkEHt2dkLj/ijRC3XJnvwgFOUg4v7VfZ8F6edX2yqE3deU1x/50+ufz
	KLn5e3Mw==;
Received: from ip6-localhost ([::1]:28114 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t6DW5-005bZK-LN; Wed, 30 Oct 2024 18:34:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15444) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t6DW1-005bZC-Pu
 for samba-technical@lists.samba.org; Wed, 30 Oct 2024 18:33:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=EzZJZSjd4OKSSTfU/Sui21RXG+9LnOTn7K782GU6DBk=; b=ZrXbLC8EVfMgkbr8uTqHMQH5Hr
 Ko6+Tgt2Nj47RRH62qnkABCHvB88C750AWZ0DgTg9x25cptgPuEZTvGDQwyvovmkMtHYZyVL4lHIF
 oNEJDixBky7uGWRQVSTnDSGPqrmmvCa7jpsqQ9II/sm3Lft/AAdfUmcqrXycB21T7FhY4fj3X17ll
 fCTNlmBQ2BddCFMu7/G+LY9xQZjv63pMGa16Mc/wAscBgrqXhWojdBBNyV+HtKLYobtZP3WJp5qqo
 5jxTfLhkMpOj70JecSGVDW63YA1kTQy7qYSTZybi0KKrDTSPbU2OyTGWodBf7826V1vr48SQTsINk
 Qtwx5791Vwt6UxAnTdGbUPURosiyQpa97I/w4HjUo5fbwS9+flBbWDdTTipUCNfwUSxMJ926NCW5L
 Mg7HT66NDzPmgBBhKKCFtW3xEBYv09SlA/CSrUHzjvBxZh7fs7wZeYlfxGAzTvLwRbVH9nkuwFRUn
 6SIB7bYu1s6q/8wj8plrV1Sl;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t6DW1-008NhE-0U for samba-technical@lists.samba.org;
 Wed, 30 Oct 2024 18:33:57 +0000
Date: Wed, 30 Oct 2024 18:33:55 +0000
To: samba-technical@lists.samba.org
Subject: Re: authentication policies in Samba 4.21
Message-ID: <20241030183355.6de5092a@devstation.samdom.example.com>
In-Reply-To: <920d8e6f-2215-427c-a6f6-e515bbb6cad8@kania-online.de>
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <68fe1182-281f-42ea-ac18-b0a2bf49961d@samba.org>
 <afa75a49-2ae4-4e14-9363-d5c31d7ef2a9@kania-online.de>
 <b5f3c39b-43c8-4b43-943d-cd851128173c@kania-online.de>
 <5d10619f-c4ed-4190-a4d1-1cec480ee108@catalyst.net.nz>
 <c420e24b-562d-4592-a9df-d0dddd069e22@kania-online.de>
 <ab589c2f-f13b-4560-bd18-7a1e88634a0d@catalyst.net.nz>
 <1a14a7d4-3d56-4212-9420-0affed9ffd18@kania-online.de>
 <0f4e2d3b-12b2-4dfc-88ef-0b52c12bf6db@catalyst.net.nz>
 <70db5ba2-8cfc-42f4-a493-0228954debdb@kania-online.de>
 <84bb05ba-823e-40a7-ba6b-d3c7ec6f2af1@catalyst.net.nz>
 <664df4a2-5133-4094-a233-5c6838413072@kania-online.de>
 <898167c5-b7d7-4bb2-9f3e-979f41608bb4@kania-online.de>
 <489883dd-1318-4172-b0b0-0f379714f927@catalyst.net.nz>
 <cc717f18-2a82-4d46-959c-27da326a047f@kania-online.de>
 <20241030171507.5d092646@devstation.samdom.example.com>
 <920d8e6f-2215-427c-a6f6-e515bbb6cad8@kania-online.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: "samba@lists.samba.org" <samba@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 30 Oct 2024 19:16:53 +0100
Stefan Kania via samba-technical <samba-technical@lists.samba.org>
wrote:

> 
> Am 30.10.24 um 18:15 schrieb Rowland Penny via samba-technical:
> > Try adding '--show-binary' to the ldbsearch command
> 
> No, I only get an empty string. I think the problem is, that the
> binary is converted to base64 if listed with ldbsearch.
> 
> root@debclient:~# ldbsearch -H ldap://win2022.winexample.net 
> 'CN=win11-policy' --cross-ncs  msDS-UserAllowedToAuthenticateTo  -U 
> administrator --show-binary
> Password for [WINEXAMPLE\administrator]:
> # record 1
> dn: CN=win11-policy,CN=AuthN Policies,CN=AuthN Policy 
> Configuration,CN=Services,CN=Configuration,DC=winexample,DC=net
> msDS-UserAllowedToAuthenticateTo: 
>   
> 
> 
> # returned 1 records
> # 1 entries
> # 0 referrals
> 
> Stefan
> 
> 
> 

Strange, it works for myself, example:

sudo ldbsearch -H /var/lib/samba/private/sam.ldb -b
"DC=ForestDnsZones,dc=samdom,dc=example,dc=com" -s sub '(objectclass=*)'

Produces

...............
# record 19
dn: DC=_kerberos._tcp.dc,DC=_msdcs.samdom.example.com,CN=MicrosoftDNS,DC=ForestDnsZones,DC=samdom,DC=example,DC=com
objectClass: top
objectClass: dnsNode
instanceType: 4
whenCreated: 20220910074319.0Z
uSNCreated: 5515
showInAdvancedViewOnly: TRUE
name: _kerberos._tcp.dc
objectGUID: 4cc3e13a-cee2-46c3-868f-459eccb43ecc
objectCategory: CN=Dns-Node,CN=Schema,CN=Configuration,DC=samdom,DC=example,DC
 =com
dc: _kerberos._tcp.dc
dnsRecord:: IwAhAAXwAABuAAAAAAADhAAAAAAAAAAAAAAAZABYGwQGcnBpZGMyBnNhbWRvbQdleG
 FtcGxlA2NvbQA=
dnsRecord:: IwAhAAXwAABuAAAAAAADhAAAAAAAAAAAAAAAZABYGwQGcnBpZGMxBnNhbWRvbQdleG
 FtcGxlA2NvbQA=
dnsRecord:: IwAhAAXwAABtAAAAAAADhAAAAAAAAAAAAAAAZABYGwQGdG1wZGMxBnNhbWRvbQdleG
 FtcGxlA2NvbQA=
whenChanged: 20231019102846.0Z
uSNChanged: 5618
distinguishedName: DC=_kerberos._tcp.dc,DC=_msdcs.samdom.example.com,CN=Micros
 oftDNS,DC=ForestDnsZones,DC=samdom,DC=example,DC=com

But:

sudo ldbsearch --show-binary -H /var/lib/samba/private/sam.ldb -b
"DC=ForestDnsZones,dc=samdom,dc=example,dc=com" -s sub '(objectclass=*)'

Produces

# record 19
dn: DC=_kerberos._tcp.dc,DC=_msdcs.samdom.example.com,CN=MicrosoftDNS,DC=ForestDnsZones,DC=samdom,DC=example,DC=com
objectClass: top
objectClass: dnsNode
instanceType: 4
whenCreated: 20220910074319.0Z
uSNCreated: 5515
showInAdvancedViewOnly: TRUE
name: _kerberos._tcp.dc
objectGUID: 4cc3e13a-cee2-46c3-868f-459eccb43ecc
objectCategory: CN=Dns-Node,CN=Schema,CN=Configuration,DC=samdom,DC=example,DC=com
dc: _kerberos._tcp.dc
dnsRecord:     NDR: struct dnsp_DnssrvRpcRecord
        wDataLength              : 0x0023 (35)
        wType                    : DNS_TYPE_SRV (33)
        version                  : 0x05 (5)
        rank                     : DNS_RANK_ZONE (240)
        flags                    : 0x0000 (0)
        dwSerial                 : 0x0000006e (110)
        dwTtlSeconds             : 0x00000384 (900)
        dwReserved               : 0x00000000 (0)
        dwTimeStamp              : 0x00000000 (0)
        data                     : union dnsRecordData(case 33)
        srv: struct dnsp_srv
            wPriority                : 0x0000 (0)
            wWeight                  : 0x0064 (100)
            wPort                    : 0x0058 (88)
            nameTarget               : rpidc2.samdom.example.com

dnsRecord:     NDR: struct dnsp_DnssrvRpcRecord
        wDataLength              : 0x0023 (35)
        wType                    : DNS_TYPE_SRV (33)
        version                  : 0x05 (5)
        rank                     : DNS_RANK_ZONE (240)
        flags                    : 0x0000 (0)
        dwSerial                 : 0x0000006e (110)
        dwTtlSeconds             : 0x00000384 (900)
        dwReserved               : 0x00000000 (0)
        dwTimeStamp              : 0x00000000 (0)
        data                     : union dnsRecordData(case 33)
        srv: struct dnsp_srv
            wPriority                : 0x0000 (0)
            wWeight                  : 0x0064 (100)
            wPort                    : 0x0058 (88)
            nameTarget               : rpidc1.samdom.example.com

dnsRecord:     NDR: struct dnsp_DnssrvRpcRecord
        wDataLength              : 0x0023 (35)
        wType                    : DNS_TYPE_SRV (33)
        version                  : 0x05 (5)
        rank                     : DNS_RANK_ZONE (240)
        flags                    : 0x0000 (0)
        dwSerial                 : 0x0000006d (109)
        dwTtlSeconds             : 0x00000384 (900)
        dwReserved               : 0x00000000 (0)
        dwTimeStamp              : 0x00000000 (0)
        data                     : union dnsRecordData(case 33)
        srv: struct dnsp_srv
            wPriority                : 0x0000 (0)
            wWeight                  : 0x0064 (100)
            wPort                    : 0x0058 (88)
            nameTarget               : tmpdc1.samdom.example.com

whenChanged: 20231019102846.0Z
uSNChanged: 5618
distinguishedName: DC=_kerberos._tcp.dc,DC=_msdcs.samdom.example.com,CN=MicrosoftDNS,DC=ForestDnsZones,DC=samdom,DC=example,DC=com

Not the same search, but it does expand '::' attributes.

Rowland

