Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D85DB8B9F60
	for <lists+samba-technical@lfdr.de>; Thu,  2 May 2024 19:22:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ZrMs/KWIUFtonlbG6DBknaqwEvLFZZ5xM3Q4fbb0R/g=; b=bvsJkse6daT71BbrnROb45KB7/
	dKQCe/iTV9gK4ilcrZDt5zW+2zzSWTNqB2rxzQTJeuM/PRQfPHmXrQcUl81BdRsDjUtTX2y4N479m
	37FYYUZexcPDMjziKRBz2Xdd9PqwrNgCTl0CoOkAP7un5pkb+PdGpYGLlXHVGHwLYA4B+CjlzlZbv
	tdcABZUffQb8/hgWTL/kd3rMwWaO8lahmNSJ4dyfcHi843tG3ig+zjFhI1wgGdwvAVEqjhALzgQIK
	w3mzPIPj6IL3eH8BUI4ub4eF+i1l7E6QZetsYcJ2VRWy7ygE/N1mpU3zm/vilRpvLVX5b+fuyJ9kz
	s/UK0aRw==;
Received: from ip6-localhost ([::1]:39168 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s2a7q-0086tF-H1; Thu, 02 May 2024 17:21:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18564) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s2a7m-0086t8-7T
 for samba-technical@lists.samba.org; Thu, 02 May 2024 17:21:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=ZrMs/KWIUFtonlbG6DBknaqwEvLFZZ5xM3Q4fbb0R/g=; b=i3X/HPutaYuSgXZjaoBMeHG+/d
 WdubhJWtts6B+HVla5iMAjzb1Bx1o0mcRWIUiZhUDwTojj82judBbmDyKzD51GVBI8HxR2O2cxr8P
 pNeK5oMdFZ4+9US6ZnzX3H32FKL2aU9hGXnPVRax/boUHYt0OCp6fAmM00Hf8rmASyCIOSwtFgAoe
 CRPFsF1ewOOpjdFiWu5tlRunOr9sdfOorbiPyalzOXy9rPtputEWG/6bHHocsgDI9a6TrWe+wYGn6
 BAMYBJCG/zPmRt1+ybUh9eVK+cTF9svFTEa3x2aiKnAtKB08LQcE1TNzDT3Adnyr/STGq4ElSK6/a
 j7wKhKVKzfiIyDAd3v43mHuuV0uLokqgA+x1CEddgH3Hss469Jb/mNCL41yQGzvnljfhl7YxOB8La
 6yfXbwuCeIFXP9T7YMZJDdcRzT7yQQvESJqkJvp8ASe68gXkyUkrYaFSzO3MqDoa6z4h+ysRqeYEi
 ej0XwwQXGldjsXzKwDdM2gVA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s2a7l-009Tfs-1Y; Thu, 02 May 2024 17:21:37 +0000
Message-ID: <f0a93a6b-ed97-4a67-bfa3-9cbd5fcb7ad5@samba.org>
Date: Thu, 2 May 2024 19:21:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: samba-gpoupdate
To: David Mulder <dmulder@suse.com>
References: <a41d2cce-e9d5-4322-80f1-e04aae0505c7@samba.org>
 <ca6277a8-4b77-4842-a18d-c10b1e93f810@suse.com>
 <8c63936e-3d09-402f-88e5-3115c32da7e6@samba.org>
Content-Language: en-US, de-DE
In-Reply-To: <8c63936e-3d09-402f-88e5-3115c32da7e6@samba.org>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 29.04.24 um 17:52 schrieb Stefan Metzmacher via samba-technical:
> Hi David,
> 
> thanks for the feedback so far!
> 
>>> Do we really want to apply all those gp_extensions by default?
>>> I would have assumed that the admin needs to configure them explicitly.
>>>
>>> Pure ad dc samba internal stuff like gp_access_ext, gp_krb_ext
>>> and my new gp_privilege_rights_ext should run by default on an ad dc
>>> and only there (the server role is checked in the code).
>>>
>>> But all others messing with critical stuff in /etc looks dangerous
>>> without explicitly selecting them.
>>>
>>> I'm also not sure how the things from get_gp_client_side_extensions() work.
>>
>> That's for loading custom client extensions (for example, if a company has internal policies they want applied). I'm not sure if anyone is using this.
>>
>> See https://dmulder.github.io/group-policy-book/writing-group-policy-extensions.html#cse
>>
>> The `register_gp_extension` and `unregister_gp_extension` functions control the policies added by get_gp_client_side_extensions().
>>
>> Notice the `samba-tool gpo cse register` and `samba-tool gpo cse unregister` commands also.
> 
> Ok, I think it would be useful if all extensions would go via this and would
> be listed by 'samba-tool gpo cse list'.
 >
> In addition something like 'samba-tool gpo cse enable' and
> 'samba-tool gpo cse disable' would be useful in order to give the admin more control
> over it. Then 'samba-tool gpo cse list' could list all active once
> and 'samba-tool gpo cse list-available' would list all possible once.
> 
> The only question is how this could be done in a compatible way compared
> to released samba versions.

I'm currently working on auto register builtin cses in parse_gpext_conf()

There I'll try to work out if the registration should enable or disable
them based on 'apply group policies = yes' and the existence of gpo.tdb

And instead of a absolute filepath I think a python module name like
"samba.gp.gp_sec_ext" should be possible, that makes it much easier
to test without changes with 'bin/samba-gpoupdate' without make install.
And also with packaging changes.

All registered cses in gpext.conf will also get MachinePolicyDisabled
and UserPolicyDisabled.'samba-tool gpo cse update' will let admins change it explicitly.
And get_gp_client_side_extensions() will only return enabled policies.

>>> Also note this seems to fail badly for users not from the primary domain...
>> I wasn't aware of that. What error are you getting?
> 
> As far as I can see we're using the machine credentials to fetch the user gpos
> and try fetch them from a dc in the servers domain not in the users domain.
> 
> I think windows fetch user gpos as user from the users domain.
> I also think the servers machine credentials may not have permissions to fetch the users gpos,
> even in the same domain.

It seems windows uses a strange mix of using user and machine credentials,
I need to analyse this further.

> I also saw that we use the account name as key into the apply logs (and maybe other stuff),
> I guess we want to use the account sid instead as that can never change, while the name can.
> 
> Also change get_gplog() to take the sid (maybe in addition)
> and use the sid as primary index.
> 
> With all that how can we make that compatible with current releases?
> Any idea?

I haven't looked at the get_gplog with sid case, so let me know
if you have ideas.

Thanks!
metze


