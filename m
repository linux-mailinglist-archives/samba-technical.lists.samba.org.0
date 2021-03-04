Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A696432DD89
	for <lists+samba-technical@lfdr.de>; Fri,  5 Mar 2021 00:01:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=GUkJ3QCYwWbeY7RCQhIvmk7jn/P+QefrbIgi4LbH07w=; b=bpMWgkAXaiX+T1yvYSJIk9YTAw
	AGh60VFeQnv+1eSA+BG7MQH3ftdKY1c8x0tbkq4olke1BikhpBSPcD/KGvvTuNSp5Is205RJRO0bj
	hJ+YnTBN9F1ZWXmmf7tigzPNl5uc5OzwWtmDSzKR8eyxbHIbwE9iSWrU7L8G9ox3ZksS5pOGY/C9O
	5GAWJaKfB+1ZFy35VU7YJwPg4k2gD6AX8M92y+XQYGvwLZnyhPSTnWFRsw0i0/E6ZmjEczLpLn75p
	CTFiNSl5y+lC/pA7V0NtAGqmAu1IpNFRvDs/91DT94vwhg79+lXKFTyu02C8DaepJGhf60JnCAlPX
	V2o49nxg==;
Received: from ip6-localhost ([::1]:55560 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lHwwi-004E3P-Co; Thu, 04 Mar 2021 22:59:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39758) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lHwwd-004E3I-OT
 for samba-technical@lists.samba.org; Thu, 04 Mar 2021 22:59:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=GUkJ3QCYwWbeY7RCQhIvmk7jn/P+QefrbIgi4LbH07w=; b=qMBBQoL6VF3AG/PIan2cEk3spP
 qT4dVz81uaJbsDPVVt59NhCBWW3ZoEc52+DR4QQdbMA6Ueo5aCMkYjGsKim5o0zHgQkNyxbYUbFUP
 Yzi4KP8mzjzUpE7s8yzdId8P4+/Lb5O5q12wCVazqml+8ST1oW8clVphVmVoXX6e9oUhlJtdYP46t
 /ezfTtXoKznI4nnzRzuvEcp+BjogmZEcuMkHBvXv+4H3I47Kj3/FDinKV5yDrT7g9P1MGmlGgI+yd
 vDM0W7uTIlytT/4h8oczQbLbOvBvNcPJkCR3/jQI0sN14j95BEUmMJWWm6TgFcpf3j4dDnCM0CF98
 RZfIqm3hJmQacIuKdGBvl7/FwtolzbTCfQX8ugfbujAaj7/48+NP8xFt1XM/m9yUNt8QfoBurXDJR
 pEqekZgGmbymIi6AIu21CHAevD9Uhh0XEcJkkL3ptc9Gja26Y4ngYwKShXsvX+iMIvViZwWsH5Fu7
 QmCs2DCnRPJty717sPdJ1gsc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lHwwb-0001s5-AR; Thu, 04 Mar 2021 22:59:45 +0000
Date: Thu, 4 Mar 2021 14:59:42 -0800
To: Vikram Bharti <vikrambharti33@gmail.com>
Subject: Re: Kerberos support on Samba
Message-ID: <20210304225942.GA965832@jeremy-acer>
References: <CAH_vq2FryOcCDD2n7_A-J_HDXfMVO16XE0aXGMfpjeW8oDsVBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAH_vq2FryOcCDD2n7_A-J_HDXfMVO16XE0aXGMfpjeW8oDsVBQ@mail.gmail.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Mar 03, 2021 at 08:57:21PM +0530, Vikram Bharti via samba-technical wrote:
>Hi,
>
>Was going through this.
>https://github.com/samba-team/samba/blob/master/source3/include/libsmbclient.h
>
>And I found that we do support Kerberos.  Please correct my understanding
>
>
>Assumption 1:- does this mean if a user x has permission on SMB share then
>he can access SMB shares by sending credentials to callback API and Samba
>can use those tokens to forward it to SMB shares and provide the access?
>What i understand from t*estBrowse *example , just enable the Kerberos flag
>and pass the user credential to call back function. Which internally uses
>Kinit to pass the credentials and get TGT and TGS exchanged. And then
>libsmbclient forward the request to SMB shares with  TGS received and
>initiate TCP session.

What do you mean by:

"Samba can use those tokens to forward it to SMB
shares and provide the access?"

Can you be really clear as to what you're asking
for here because I don't currently understand it :-).

>Assumption 2:- it's only possible to get the token for the service account
>set up for a computer account as mentioned below.
>
>Setspn -s http/<computer-name>.<domain-name> <domain-user-account>
>RegardsVikram

Setspn is a Windows client command.

Again, what does:

"it's only possible to get the token for the service account"

mean for Samba ? Windows clients happily use krb5 from user
accounts to talk to Samba servers.

