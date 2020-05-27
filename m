Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A988A1E4E95
	for <lists+samba-technical@lfdr.de>; Wed, 27 May 2020 21:53:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=/JLUlAa4srJyBp+nLiKpO+0+eKw/FHH4xxYzVMq/Evw=; b=kOnqAT0Nl1ZhsWS8LW5G5+8PyU
	lXvAHaAOjDkoFb9ajW/QhXgenNNM9bsStf5/UtFcMEXUCQ45MNgr5RJ7Pbnf9D7WGs1+iACIEqYlA
	BKNjsNpwDQc3jun4Rv9t2bEo4+Nx7N14vaNzhpTwr/a7s4xU1FGn0kPBvS63rpurGarwST35J/SEI
	uUDLIwCRX9Zm6aSfexsm2+4JpsQFfEczr2bC+kIy8E1dbhREmiOL2ThwCEXL7dQr8PkmlLvx2o6jQ
	FMYLvAxCfo5gBbZJsFIWxXgJgEYcJM8KG8oYKZHmP9Jz+brIn6gzKFGlPT9wg4oSM8kiqaOQgLZAk
	d5J+x2Jg==;
Received: from localhost ([::1]:19634 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1je279-0065au-FN; Wed, 27 May 2020 19:53:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50358) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1je273-0065an-GB
 for samba-technical@lists.samba.org; Wed, 27 May 2020 19:53:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=/JLUlAa4srJyBp+nLiKpO+0+eKw/FHH4xxYzVMq/Evw=; b=tqCZZZPcjyt+UklcRK3dQfzsPq
 O6Sma/Tkrcgb/cDNpX26YdyW/79m18WEpUnEWTev81N3K+q3Mj60/QPRIoPkRBwMz+eRCbIjafnL8
 +cPWAgBtjruTHJ9I7F8uLrI/Gaz3oYGwOyrV7t7bNEp0KxB8RUXCuQGkqP47ODLDiru5TiSMpbL0w
 AyvVLpPTYkwVT8YSPN8h/yIAWK4k9r+z9axQkr8gPLEdbaqH/po1WvMRe690aaWdyGULE0DMO8f6B
 7+iZ+8/DNLwlNG1RY47Sjqb+jwimhTFEApwrnYL/K6eInw0DTlDtEdWNPKWtcO6t0Cljks52mQ9Ak
 N4k0sRgVJ6kzhK+0j8ChLZJz4vKSrtpdonQ6ddB6wTTF3FVzriRDBjAMgUNxosjraUU3PKeE7D29R
 p3xd4SRJPoRpGaQxMDjmnCRQPet2gkIg/nFirOS+xUv40brgZ/vtzgqBMmDkWWUnPWkxuqRLT1wOU
 L5hTOSbHlZcRQrSBzBvC3Rd+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1je272-0002HR-GS
 for samba-technical@lists.samba.org; Wed, 27 May 2020 19:53:17 +0000
Subject: Re: Samba user quota implementation question
To: samba-technical@lists.samba.org
References: <4D14BB46-74F3-4EB7-A3F4-0C290A464D16@contoso.com>
Message-ID: <beb6a045-722d-fe0d-e41d-ab7a25fbc5fb@samba.org>
Date: Wed, 27 May 2020 20:53:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <4D14BB46-74F3-4EB7-A3F4-0C290A464D16@contoso.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 27/05/2020 20:42, Krishna Harathi via samba-technical wrote:
> Our OneXafe FS  supports share/fs level quota using smb.conf “set quota command” and “get quota command”.
>
> We are currently extending support to user-level quotas using the same interface, when Samba smbd is an AD DC member.
>
> Setting user quota from a windows client is working as expected. But once quota is set, none of the users are listed in the quota’s pop-up window, so cannot delete or modify quota properties. Moreover, creating a new quota entry for the same user is generating a “quota entry already exists for this user” error.
>
> By tracing get/set requests to our file server, I see that our FS server is receiving a get request for Samba for every user entry in the local password file, but none for the UID of the DC member user. But I do see a default quota get request for the group GID.
>
> The problem seems to be that the get/set command interface does not obviously support a “list” user quota api to the hosting FS.
>
> Questions on this –  We can post and manage user entry (host-local uid/gid) corresponding to the DC user sid/gid whenever a “set user quota” is received. I did verify that when an entry is made manually, windows user quota workflow behaves as expected. Is the problem assumption correct and is this a way to implement? Is there a better way, given the constraints?
>
> We are using Samba 4.7.11 patched with https://bugzilla.samba.org/show_bug.cgi?id=13553#c17 fix for 4.7.
>
> Any help is this issue is much appreciated in advance.
>
> Regards.
> Krishna Harathi

 From reading the above, it looks like you are saying that you have the 
same users in /etc/passwd and AD, is this correct ?

Can you also please post the entire smb.conf you are using on the OneXafe.

Rowland



