Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D788B28CD
	for <lists+samba-technical@lfdr.de>; Thu, 25 Apr 2024 21:10:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=bdrft2bYjAGls4+S2hdrBVNtEmFCXrRx3+fbFW6hRsk=; b=mPNNK9yrhBrt3OnX1d1fE0pY0l
	exSOitjIrWZceSld6kdJ+d5qYrd7pLRUEcb6/3fFLxRIGSRnW25GBw16jATQmbvbOT9rkPi2i0I+O
	BNG5ZVMHj3ZbC2NdpsD2Ew3oXHXrRvIhg8pzEyT7rQkl+28wT0Tjdah5lavQ4QAPJOFaIln84TvSu
	vkDfb5K6ITNgMivXju6kJCj0R4SkPxo2BXPuhCud2M2JGbU/xwT3EVisS+t6h6bFPhg59Ieq8Aj4o
	OA1TZod0d6vn5G6fW9rHmYk9p4XMO9wAbuhBhnGENxnlUAf+/KIYs+cI0AF8Hme1d1Cq02vmWE+wF
	FYRDiFBQ==;
Received: from ip6-localhost ([::1]:41568 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s04UI-005jsx-Gh; Thu, 25 Apr 2024 19:10:30 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:52541) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s04UB-005jsp-DM
 for samba-technical@lists.samba.org; Thu, 25 Apr 2024 19:10:26 +0000
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-51abd9fcbf6so2367290e87.1
 for <samba-technical@lists.samba.org>; Thu, 25 Apr 2024 12:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1714072222; x=1714677022; darn=lists.samba.org;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=bdrft2bYjAGls4+S2hdrBVNtEmFCXrRx3+fbFW6hRsk=;
 b=P6GhdIIcZeUGTimRLAOz/O77WNeycPQvBor2IcADXk8P635gF9scCPT6rCYNKP1J/a
 9yWuzwEkWndeqIXYK2fMF/t5TZNKHOIQlkixUJsuNSMFyA/QWkH37rYHL9Ifuc1z+1At
 5RumUhDvF9OlMeAwqVJMSnv6vo8uu1CInHml7NnpQx4KkVXBPCKCurfnRwLp03/5WA40
 FB/EbGzVcFEXCRUgDdkM0wSjHvIkuUP4RIRF46ooX3HiSyOeA2Qs4GsBBTAfWA2YO8dI
 0SIeWlXb716hXEZs2NPMIjwuaQRokWEn/SjZmflDdmaT3FNTQilMqbfVv6K7mSPL4Yib
 Ya4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714072222; x=1714677022;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bdrft2bYjAGls4+S2hdrBVNtEmFCXrRx3+fbFW6hRsk=;
 b=OXKodo4U2b7bQIYbgXXJATM4qkRHsJj2STjEQxuVX9qMoCsiNjH0ewiDc/IwadPicM
 tJaUcyzhJIbBIqirR5/1Fw82gUWv7BgkMu7SN23x6mfJKM7EH1+mSuxG6Y+5WmErxN36
 CMRF6BOnTptZTidizxTwt965gXFlnZu4twoh0wqcndPRf4jAy9Yb7wpGtS192VpQbAu5
 KvePVE3o/+C01DcNR9ZIx020SxbYcnftwHVvoYLe8nryNE6s/z4GdvitEVwSSZSVrUCi
 M93HenNkRjqnJQPDY8Jz8OyctQzuF850WkIrrxbJJyjxckvrD3fmZuLlVZs0ORA4HMR5
 37Jw==
X-Gm-Message-State: AOJu0YwWYEWTHtUd2LG0XZJb648fFy5bwIeCWcD7x2Dta5UgRxcb295Y
 jdDnFGbHrsJLfB7SisPbCaNbJQ1XyKv/OylYd0SXZRnTsgrG263+xQJqgjTtg88=
X-Google-Smtp-Source: AGHT+IFcxecFCwmOPt17WYg9EP8UVzXsdvGSpZJUzjLzUR46dJjgdOI+yurNpjOYEsADNLPFotOqVA==
X-Received: by 2002:ac2:5f67:0:b0:51c:647c:c209 with SMTP id
 c7-20020ac25f67000000b0051c647cc209mr191700lfc.50.1714072221996; 
 Thu, 25 Apr 2024 12:10:21 -0700 (PDT)
Received: from [172.16.1.175] ([80.95.105.245])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a1709070b1100b00a558206b2c5sm8661458ejl.99.2024.04.25.12.10.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 12:10:21 -0700 (PDT)
Message-ID: <ca6277a8-4b77-4842-a18d-c10b1e93f810@suse.com>
Date: Thu, 25 Apr 2024 13:10:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: samba-gpoupdate
To: Stefan Metzmacher <metze@samba.org>
References: <a41d2cce-e9d5-4322-80f1-e04aae0505c7@samba.org>
Content-Language: en-US
Organization: SUSE
In-Reply-To: <a41d2cce-e9d5-4322-80f1-e04aae0505c7@samba.org>
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
Reply-To: David Mulder <dmulder@suse.com>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


On 4/25/24 10:17 AM, Stefan Metzmacher wrote:
> Hi David,
>
> I'm currently try to implement some gpo updates for AD DCs.
> '[Privilege Rights]' from within 'MACHINE/Microsoft/Windows 
> NT/SecEdit/GptTmpl.inf'.
>
> While doing that I noticed that 'samba-gpoupdate' running on the AD DC
> tries to process 'Google/Chromium' and 'Google/Chrome'.
>
> Then I found this:
>
>     machine_exts, user_exts = 
> get_gp_client_side_extensions(lp.configfile)
>     gp_extensions = []
>     if opts.target == 'Computer':
>         gp_extensions.append(gp_access_ext)
>         gp_extensions.append(gp_privilege_rights_ext)
>         gp_extensions.append(gp_krb_ext)
>         gp_extensions.append(gp_scripts_ext)
>         gp_extensions.append(gp_sudoers_ext)
>         gp_extensions.append(vgp_sudoers_ext)
>         gp_extensions.append(gp_centrify_sudoers_ext)
>         gp_extensions.append(gp_centrify_crontab_ext)
>         gp_extensions.append(gp_smb_conf_ext)
>         gp_extensions.append(gp_msgs_ext)
>         gp_extensions.append(vgp_symlink_ext)
>         gp_extensions.append(vgp_files_ext)
>         gp_extensions.append(vgp_openssh_ext)
>         gp_extensions.append(vgp_motd_ext)
>         gp_extensions.append(vgp_issue_ext)
>         gp_extensions.append(vgp_startup_scripts_ext)
>         gp_extensions.append(vgp_access_ext)
>         gp_extensions.append(gp_gnome_settings_ext)
>         gp_extensions.append(gp_cert_auto_enroll_ext)
>         gp_extensions.append(gp_firefox_ext)
>         gp_extensions.append(gp_chromium_ext)
>         gp_extensions.append(gp_chrome_ext)
>         gp_extensions.append(gp_firewalld_ext)
>         gp_extensions.extend(machine_exts)
>     elif opts.target == 'User':
>         gp_extensions.append(gp_user_scripts_ext)
>         gp_extensions.append(gp_user_centrify_crontab_ext)
>         gp_extensions.append(gp_drive_maps_user_ext)
>         gp_extensions.extend(user_exts)
>
>
> Do we really want to apply all those gp_extensions by default?
> I would have assumed that the admin needs to configure them explicitly.
>
> Pure ad dc samba internal stuff like gp_access_ext, gp_krb_ext
> and my new gp_privilege_rights_ext should run by default on an ad dc
> and only there (the server role is checked in the code).
>
> But all others messing with critical stuff in /etc looks dangerous
> without explicitly selecting them.
>
> I'm also not sure how the things from get_gp_client_side_extensions() 
> work.

That's for loading custom client extensions (for example, if a company 
has internal policies they want applied). I'm not sure if anyone is 
using this.

See 
https://dmulder.github.io/group-policy-book/writing-group-policy-extensions.html#cse

The `register_gp_extension` and `unregister_gp_extension` functions 
control the policies added by get_gp_client_side_extensions().

Notice the `samba-tool gpo cse register` and `samba-tool gpo cse 
unregister` commands also.

> Also 'apply group policies = yes' meaning we apply computer and user 
> gpo's
> looks also very unflexible.
Agreed. This could use some work.
> Maybe we could have a 'samba-gpoupdate --ad-dc-computer' that runs
> from a task forked from 'samba' instead of winbindd.
> And that will only do ad dc specific stuff.
> And the current mode would only work on domain members?
Fine with me. Also, if an admin would really like to have a certain gpo 
apply to the ADDC, they can always re-enable it with `samba-tool gpo cse 
register`.
>
> Also note this seems to fail badly for users not from the primary 
> domain...
I wasn't aware of that. What error are you getting?

-- 
David Mulder
Labs Software Engineer, Samba
SUSE
1221 S Valley Grove Way, Suite 500
Pleasant Grove, UT 84062
(P)+1 385.208.2989
dmulder@suse.com
http://www.suse.com


