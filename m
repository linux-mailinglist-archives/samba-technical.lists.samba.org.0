Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A258B262A
	for <lists+samba-technical@lfdr.de>; Thu, 25 Apr 2024 18:18:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=jnTgTALOl7ZWd5q2lPtirpBN2QSmoHBaZGks8q0C5WY=; b=ZB2aNfRAsKU9JNppo6e6BefGo9
	PC1pFg/vQbanZvYbvXfHKTdO2VzMgHEvm5w/uISQQRmaO+z+AIAXoc/FT2w+tabUKf4fNRKLOzftL
	q1x22EZrBNg5IskeQPPZs5yt9KkE+XtoheJ8HkTTf9PHn51SryJiFawBb6894UgzIEfdfvwmTAsDZ
	+lc5Oc2cgP6Fe6Mkaj8pE6P6sPrjKve/GBT2xMFTISPr9Ck93MV/uOtrbCgdQHzporAy5RIWQgLqX
	wiUktOY+Z62ZnfRIUBFzcZTvNRUSOfOB5bcTecn0t6y0pdqHWnS8YMKKU0mlbhAfjm1pPqWrjBG8D
	NLzjRu5w==;
Received: from ip6-localhost ([::1]:28748 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s01mq-005hIf-Ml; Thu, 25 Apr 2024 16:17:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36008) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s01mn-005hIY-Eo
 for samba-technical@lists.samba.org; Thu, 25 Apr 2024 16:17:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=jnTgTALOl7ZWd5q2lPtirpBN2QSmoHBaZGks8q0C5WY=; b=MAQqAs+wEUcsFIEUic6AGOBs9K
 3jDYeMKznU49TWuzCty/3DpMbIk1qQaagSEH3J/73Y2PrWg3QgNsfxKCnFn5+2cepIaXDwKzGM79H
 E+9CQ0Wt5ttxZo+ZMkJWSkxc/DQrcOZMIgGR2ZdDMEjsQNxLQAT5rcg6y++LxWsrK15IDX2Ppw51u
 jOfRsID8u2KzeXNg4q15+U7ZEH4v+OCVEyeJi6KOZdFP4BH3VRpnaYxXlLC/RVL/71teL8iJ443no
 j7UaH7IzqfkiXbXHjTLLSxwQhcBSOHS3hj0079bdW70uV59H8Q+dNOyIRxagbkJGacbSwdqYcisJj
 CElUcg9f8fmPztvxKZXhNYVjpjDtcBXyBwb4M85uXhtp6XOWY2MLMUn7MnO92hPf9CN8YIAP73X1Z
 9/NlmhAewYYlWwu6WpHuP3Cad54yp6Uoi5e+v8wg8USvQJT8mj7YlYN4KQfh/mZ3wBqgx/y77EInU
 KW8eTDMVrPiesQ13QHpHsJ7+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s01mm-008Jz5-2O; Thu, 25 Apr 2024 16:17:24 +0000
Message-ID: <a41d2cce-e9d5-4322-80f1-e04aae0505c7@samba.org>
Date: Thu, 25 Apr 2024 18:17:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: David Mulder <dmulder@suse.com>
Subject: samba-gpoupdate
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

Hi David,

I'm currently try to implement some gpo updates for AD DCs.
'[Privilege Rights]' from within 'MACHINE/Microsoft/Windows NT/SecEdit/GptTmpl.inf'.

While doing that I noticed that 'samba-gpoupdate' running on the AD DC
tries to process 'Google/Chromium' and 'Google/Chrome'.

Then I found this:

     machine_exts, user_exts = get_gp_client_side_extensions(lp.configfile)
     gp_extensions = []
     if opts.target == 'Computer':
         gp_extensions.append(gp_access_ext)
         gp_extensions.append(gp_privilege_rights_ext)
         gp_extensions.append(gp_krb_ext)
         gp_extensions.append(gp_scripts_ext)
         gp_extensions.append(gp_sudoers_ext)
         gp_extensions.append(vgp_sudoers_ext)
         gp_extensions.append(gp_centrify_sudoers_ext)
         gp_extensions.append(gp_centrify_crontab_ext)
         gp_extensions.append(gp_smb_conf_ext)
         gp_extensions.append(gp_msgs_ext)
         gp_extensions.append(vgp_symlink_ext)
         gp_extensions.append(vgp_files_ext)
         gp_extensions.append(vgp_openssh_ext)
         gp_extensions.append(vgp_motd_ext)
         gp_extensions.append(vgp_issue_ext)
         gp_extensions.append(vgp_startup_scripts_ext)
         gp_extensions.append(vgp_access_ext)
         gp_extensions.append(gp_gnome_settings_ext)
         gp_extensions.append(gp_cert_auto_enroll_ext)
         gp_extensions.append(gp_firefox_ext)
         gp_extensions.append(gp_chromium_ext)
         gp_extensions.append(gp_chrome_ext)
         gp_extensions.append(gp_firewalld_ext)
         gp_extensions.extend(machine_exts)
     elif opts.target == 'User':
         gp_extensions.append(gp_user_scripts_ext)
         gp_extensions.append(gp_user_centrify_crontab_ext)
         gp_extensions.append(gp_drive_maps_user_ext)
         gp_extensions.extend(user_exts)


Do we really want to apply all those gp_extensions by default?
I would have assumed that the admin needs to configure them explicitly.

Pure ad dc samba internal stuff like gp_access_ext, gp_krb_ext
and my new gp_privilege_rights_ext should run by default on an ad dc
and only there (the server role is checked in the code).

But all others messing with critical stuff in /etc looks dangerous
without explicitly selecting them.

I'm also not sure how the things from get_gp_client_side_extensions() work.

Also 'apply group policies = yes' meaning we apply computer and user gpo's
looks also very unflexible.

Maybe we could have a 'samba-gpoupdate --ad-dc-computer' that runs
from a task forked from 'samba' instead of winbindd.
And that will only do ad dc specific stuff.

And the current mode would only work on domain members?

Also note this seems to fail badly for users not from the primary domain...

What do you think?

Thanks!
metze

