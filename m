Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9419B58D1
	for <lists+samba-technical@lfdr.de>; Wed, 30 Oct 2024 01:48:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=3o4uI/vlD8l9gnt+yQqsFOg6htfZ/PWcLxX3QfiFjw8=; b=A8w78KVWJlC2nlFhtSdRZ1n5El
	moD72uhKMfbZnYCr7AOSSIQx1gIRTIcQcHMTm0S4lAoNRzfYTqufjVSnv6Q86BKOWzJvDkVzAtOEi
	8XYVBdYb8/650uSvoPbs+YdqlhF7b2rKinJXHXIke6KfAmjL8blhS5+a6pj3UbiEAmmNMTacgB6S0
	KWusUS5gBqhDRipE7wdxjJQa2Irdj2fsO6LHJBJdydIa41+lZmkgTIgBfSOPRXHW4zgrFqx8ME33M
	46rIOpFosKTjG7D/QQ7LiCcbFg8e+ks4dL+mV6lUu8zifzoIDx2aAruDfjL5xbhGYV34yCpJ8Jmhf
	QJNtdIkQ==;
Received: from ip6-localhost ([::1]:42544 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t5wsU-005Wsz-Ek; Wed, 30 Oct 2024 00:48:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31814) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t5wsQ-005Wss-CP
 for samba-technical@lists.samba.org; Wed, 30 Oct 2024 00:48:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=3o4uI/vlD8l9gnt+yQqsFOg6htfZ/PWcLxX3QfiFjw8=; b=NAn+bKo5jeabpn4/Fl8icFiRwk
 yOoMKFYSDKRhLjKulDAVNQ0P/LkVkupdVSV55XQa6Rh+KFDjO7WYzJ72HMZssfk0eH92qbTQ1KDbu
 Tsx44+Yy3bodIwFSRWsMWdiMPOWm4Nh9ozV5RtSiw55qDyEmNQojNTv0Ugp1/dM3T7mbadRTNMryb
 v0tn+BRXtwjbs1NFxCJn/PXas+X+QohnEQWUGtVCRTJiVoA6tbXyybDAdDDA2Oo7NRbV1yArUn5Dp
 egnVCDAdojRTxSAe45SuOuOrrggp3I9oYxrAOTYzut2PtvAmqSSflDWwRncJpzjeTe363zOYyxj0K
 oj0umCwU4GN7uHqfyV7xMIZsM+V7+9hvbXbTVEo9oljUH9R8WEdqPebsktrMeA1/g3Yy2CDYu+mvW
 p/XR2kMpIo4+0ohKdGJ8P8pnSOAsiRYy8bP7jxbesnUMzWPW34cYQ5UdrX7jyLq5ya5dyXvQ/yGPH
 wWXW4M+IoQt1vo+VudF9u6UD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t5wsP-008Frj-0G for samba-technical@lists.samba.org;
 Wed, 30 Oct 2024 00:47:57 +0000
Message-ID: <f7abd9d1-c02f-47ef-8d2b-edd51737a4e7@samba.org>
Date: Wed, 30 Oct 2024 13:47:47 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: authentication policies in Samba 4.21
To: samba-technical@lists.samba.org
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
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
 <0f4e2d3b-12b2-4dfc-88ef-0b52c12bf6db@catalyst.net.nz>
 <70db5ba2-8cfc-42f4-a493-0228954debdb@kania-online.de>
 <84bb05ba-823e-40a7-ba6b-d3c7ec6f2af1@catalyst.net.nz>
 <664df4a2-5133-4094-a233-5c6838413072@kania-online.de>
 <898167c5-b7d7-4bb2-9f3e-979f41608bb4@kania-online.de>
Content-Language: en-GB
In-Reply-To: <898167c5-b7d7-4bb2-9f3e-979f41608bb4@kania-online.de>
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
From: Jennifer Sutton via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jennifer Sutton <jsutton@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 30/10/24 6:33 am, Stefan Kania via samba-technical wrote:
> Hi,
> 
> I still not getting it working like expected. I now set up a Windows AD 
> (Server 2022)to test it and get the ldap output for the user, the 
> computer, the policy and the silo. I will post it here as soon as I'm 
> finished to compare the results.
> But the ticket-liftime is bug, I think.
> 
> Stefan

The ticket lifetime bug has been fixed: 
https://bugzilla.samba.org/show_bug.cgi?id=15692

samba-tool didn’t account for that fact that ‘msDS-UserTGTLifetime’ is 
measured in NTTIME units, not minutes. So the ticket was valid only for 
a tiny fraction of a second.

For the moment, try setting the lifetime to 900000000 instead.

Cheers,
Jennifer (she/her)


