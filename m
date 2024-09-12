Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D610977418
	for <lists+samba-technical@lfdr.de>; Fri, 13 Sep 2024 00:08:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=MpwQqlOkZhP2d3hOMazvgwZ7A3vcpkyRiGJRUxmmvcg=; b=CqgT3i4V2R+zHltWdJSUElgZYu
	ZHD3vCeeLFsHreAGDSoxtH1YLXpvFJdboiSr1JsU+22XkO7x3ObQpeKbSVMoouaAJZM4XAYse9lgH
	qtQDA7w8rUtZJCRQYaDMKXA/IFgu8ZqPjmBtz2uNXcrmR0wFIbBMU7m4dRNSzWb2qdF/Xs3UNGSbg
	6Z6LaSlc3u+yZAebpkUdu9hy2eRdk2O2X5zcsWoXpIDkU/BO/KwKlCMDFZ5EWwKZTbfAa1l+uYP3H
	sAPWCmdHhMP5t3AdODwNSEVVCT0Zuca1d6pfDZ7SZgeaC4p4KJzZTyUZkEJNQL3jJ0Pa3uv7GND+s
	am6t+qdg==;
Received: from ip6-localhost ([::1]:24180 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1soryS-008LQJ-TQ; Thu, 12 Sep 2024 22:07:36 +0000
Received: from cat-hlzsim-prod-mail1.catalyst.net.nz ([103.250.242.12]:41126) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1soryG-008LQA-TR; Thu, 12 Sep 2024 22:07:34 +0000
Received: from [192.168.192.96] (wlgwil-nat-office.catalyst.net.nz
 [202.78.240.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-hlzsim-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id C4DA33F770; 
 Fri, 13 Sep 2024 10:07:15 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1726178835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MpwQqlOkZhP2d3hOMazvgwZ7A3vcpkyRiGJRUxmmvcg=;
 b=bcYy0IsVK5jkJbX2YXyyqoicoEr53bZVHMN0uKHJ46vGRYwt/QJD37g09Ps2UG0NZTVGAn
 ruPAovNJL737J71RiODLUA78CxWjZoBZPQQlW4Yt6Uu64BOO9TNOOnEy0J6dFjPMy/L3d4
 Tqc83p6ADGtmzUXYAoh83EmRRXnDWosZpqw79tGJSSkH92isYOE3ii74rnKX4ReqoBj4l3
 IcmbOgctxtxg04zfI20zVjhtH5gz5f/sd7T2QgwByyNr7xPacLdbZXbyIll5Gt873SKPbS
 1MIZCYpRiLbHQq9sxNGgB3QTp3OmC6ptVHtc4wnK4830Y1JI3SCXCmepzSDnZQ==
Message-ID: <928036a8-d67f-4def-8025-6fb26aa94c64@catalyst.net.nz>
Date: Fri, 13 Sep 2024 10:07:15 +1200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Samba secures funding from Sovereign Tech Fund
To: Ralph Boehme <slow@samba.org>, sambalist <samba@lists.samba.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <be66c54e-7e37-4bac-8d7c-efde20d22d48@samba.org>
Content-Language: en-US
In-Reply-To: <be66c54e-7e37-4bac-8d7c-efde20d22d48@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-30.10 / 15.00];
 LOCAL_WHITELIST_IP(-30.00)[202.78.240.7];
 MIME_GOOD(-0.10)[text/plain]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[]
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

On 13/09/24 02:43, Ralph Boehme via samba-technical wrote:
> Hello Sambaistas!
> 
> Some of you have already noticed the exciting news that I'd like to 
> hereby share with all of you:
> 
> The Samba project has secured significant funding [1] from the German 
> Sovereign Tech Fund (STF) to advance the project. The investment was 
> successfully applied for by SerNet. Over the next 18 months, Samba 
> developers from SerNet will tackle 17 key development subprojects aimed 
> at enhancing Samba’s security, scalability, and functionality.

This is great news. Congratulations Ralph and others involved.

Douglas


