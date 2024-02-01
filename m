Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B49A1846236
	for <lists+samba-technical@lfdr.de>; Thu,  1 Feb 2024 21:58:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=w7bCWo6CZAQxKMGG5tUtD6Ut7JGdRg5OLaUKFdjzRyg=; b=jof5NraoyHvo69w++L4EQOXsbX
	nlVEsVM5QQ52YkgnSwphTflAKOxyzHziO4yRQAiII/knQcE+9v7BQRAm+2xGsE20zsWkQaKJl1qTv
	oGko6SpeEPTi4ycfbh1PgrN8QYj+WSLEyUbznss0U38+Uy7MnraJsBIqEBGEkn1Ayrhoze8FwmaXd
	e6XVKshD989Ga7G+YjX+M51vIVcUJ7r9GgsZxacPsCIaBT71CKjkKzUgDWPfvm8ZqllLwNFIRXkGg
	IlTig4ZgvOBozq03Npg0vYpCJ9w2g8qYGSmfHARaJEieSdGb2dqHb18jMSSNrlr5JQNmR5cIlC/cF
	97h5hn6g==;
Received: from ip6-localhost ([::1]:62108 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rVe8R-007J22-Rr; Thu, 01 Feb 2024 20:58:11 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:57814) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rVe8L-007J1v-Tw
 for samba-technical@lists.samba.org; Thu, 01 Feb 2024 20:58:10 +0000
Received: from [IPV6:2404:130:0:1000:2225:64ff:fe75:8a7f] (unknown
 [IPv6:2404:130:0:1000:2225:64ff:fe75:8a7f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 6C9AA8146C; 
 Fri,  2 Feb 2024 09:38:53 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1706819933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=w7bCWo6CZAQxKMGG5tUtD6Ut7JGdRg5OLaUKFdjzRyg=;
 b=UJak63t7JL/xsRqZpdrmYC1/7KtU6kNaJ7goANa1ECGeDshI7dOQPaMukrEPyTp0wIDskj
 g72r9PcZH/dHunMfV64vCU/xBc8HlOrQYbOWK1sqRDcURtuGLP83E+cNaKyDcmAnJ8MIVB
 y0Fltzy4/ZPQ+tDWgPJFvoTsN4p4ZupR0vlwoIWTXlaaX8hSEC1KVGwAjz9aR7mEndgoa/
 C7ePFHtggsh4eVepALPwkJoFIeTEzm+xp9mVvLCeGnbFN2KqE/Zs3zkPdZ/DyM3ciCLav7
 Ym2HNCNWcY9ZzyzHAgYlm93NnEWswoCu0IdBx85a6vsL+ZxpcriuvyGHhW7PzQ==
Message-ID: <6d845bb3-3348-4025-abec-e749287d7392@catalyst.net.nz>
Date: Fri, 2 Feb 2024 09:38:51 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question for time based group membership in FL 2016
Content-Language: en-US
To: Stefan Kania <stefan@kania-online.de>, samba-technical@lists.samba.org
References: <14cf1029-2378-489d-bf9b-844ed9d67081@kania-online.de>
In-Reply-To: <14cf1029-2378-489d-bf9b-844ed9d67081@kania-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.09 / 15.00]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 MID_RHS_MATCH_FROM(0.00)[]
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

On 2/02/24 07:22, Stefan Kania via samba-technical wrote:
> Hi to all,
> 
> I already posted the question in the samba-mailinlist but I think it's 
> more a question for developers :-)
> 
> I have a question about FL 2016 and if samba supports it. If yes, how 
> can I use it without powershell.
> 
> In FL 2016 there is the possibility to put a user into a group and the 
> membership is time based. So I could put the user Foo into the group 
> 'domain admins' for 30 minutes and after 30 minutes the system will 
> remove user foo from the group.

That sounds good. We don't do that, and we don't call it part of 
"functional level 2016".

The things that count as "functional level" are listed here:

https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/active-directory-functional-levels

They are protocol level things -- supporting FL2016 means you can 
properly be a DC in an FL2016 domain.

Temporary memberships is a useful trick that Windows Server 2016 can do, 
for which FL2016 is necessary, but not sufficient.

That's my understanding, at least.

Douglas


