Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1388C8B5E26
	for <lists+samba-technical@lfdr.de>; Mon, 29 Apr 2024 17:53:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=/zIMuv6S6ehyd3dOslxT4P0Stq5OCWEq8Rr+/vXrr7k=; b=Wn8wSsSsFKuKUHHhYxMY9H6+X4
	kFMWbKk2FtDtlMpvs7Zagku5R7f7xI9RB15mEdclO+2hslA3tICTg5mirtkwznA1xCZE0eTseqH/W
	AIKcBYO7lxHNSEHBkPzLlC54GnUAbV1hkHcIDGiGpnDdhUSsW2oNZxhANvbZHl+VWyV/AfdKnf4Mi
	bmAfaSIuCiQkEBkB6ZDgo7yjJQScbptWs22AH+Jr9Mizn97OtytZo2RRf0iMl3pqEONK0CGNA+p+Y
	iHzc3a0oLCsOR5vUCQV1TjPob81IBs8GbmBfVVItaZDUH08wxasrdvniNdjijtXT7Jbv2eR9opSOz
	+rBOoVBw==;
Received: from ip6-localhost ([::1]:42664 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s1TIt-0060jY-Jc; Mon, 29 Apr 2024 15:52:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28084) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1TIp-0060jR-Ho
 for samba-technical@lists.samba.org; Mon, 29 Apr 2024 15:52:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=/zIMuv6S6ehyd3dOslxT4P0Stq5OCWEq8Rr+/vXrr7k=; b=XfMeb1tUCGT19BPnRj0PhUYb+U
 gtjhw36jNj40YFBqqFr9oxPJRZ8MsTKmwvOiT+2wXvT9aHYlVpNuw/6l8cleTqFQ8c7txkSm2ajnv
 WGWj2fnTH7gwkeuzgYEDc2aq6uvapt8MBhGqLYBJNm0+u8+o2Qg6/i9sxO6h3T8ZHgvHi5Re2whNZ
 tyQwZUr6K1r5z54hoKOM/KqiON7fVz6hbS2A+OGqFTDLBjeaPf+mmYuliJ3KgG4J9WalopBkq2YnQ
 RMzxmbLE5U/+UDi4Sjljedrn7+hlddjdIfkQ8FUzy1hhcomzxCe6loEg4KhC7VURM7v8AEJb8vN8k
 ojfxeGcOeaQZzRceTgi9Jp7eooFxXb9uRX4qSGzNqXMeNzoDMjYrL8ERyIQgjy856qd0DfbpFsLfO
 wk/E4W7rYIXJBWtDkKgL5IjUs3Y6Zfl7R7fZYkpwoPAFELaPpKX8UT/Ot+TPkqfXitKUTjW0NSYys
 9JPjLRaWi8FAuTQuDxvROsIq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1TIp-008xF6-04; Mon, 29 Apr 2024 15:52:27 +0000
Message-ID: <8c63936e-3d09-402f-88e5-3115c32da7e6@samba.org>
Date: Mon, 29 Apr 2024 17:52:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: samba-gpoupdate
To: David Mulder <dmulder@suse.com>
References: <a41d2cce-e9d5-4322-80f1-e04aae0505c7@samba.org>
 <ca6277a8-4b77-4842-a18d-c10b1e93f810@suse.com>
Content-Language: en-US, de-DE
In-Reply-To: <ca6277a8-4b77-4842-a18d-c10b1e93f810@suse.com>
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

thanks for the feedback so far!

>> Do we really want to apply all those gp_extensions by default?
>> I would have assumed that the admin needs to configure them explicitly.
>>
>> Pure ad dc samba internal stuff like gp_access_ext, gp_krb_ext
>> and my new gp_privilege_rights_ext should run by default on an ad dc
>> and only there (the server role is checked in the code).
>>
>> But all others messing with critical stuff in /etc looks dangerous
>> without explicitly selecting them.
>>
>> I'm also not sure how the things from get_gp_client_side_extensions() work.
> 
> That's for loading custom client extensions (for example, if a company has internal policies they want applied). I'm not sure if anyone is using this.
> 
> See https://dmulder.github.io/group-policy-book/writing-group-policy-extensions.html#cse
> 
> The `register_gp_extension` and `unregister_gp_extension` functions control the policies added by get_gp_client_side_extensions().
> 
> Notice the `samba-tool gpo cse register` and `samba-tool gpo cse unregister` commands also.

Ok, I think it would be useful if all extensions would go via this and would
be listed by 'samba-tool gpo cse list'.

In addition something like 'samba-tool gpo cse enable' and
'samba-tool gpo cse disable' would be useful in order to give the admin more control
over it. Then 'samba-tool gpo cse list' could list all active once
and 'samba-tool gpo cse list-available' would list all possible once.

The only question is how this could be done in a compatible way compared
to released samba versions.

>> Also 'apply group policies = yes' meaning we apply computer and user gpo's
>> looks also very unflexible.
> Agreed. This could use some work.

>> Maybe we could have a 'samba-gpoupdate --ad-dc-computer' that runs
>> from a task forked from 'samba' instead of winbindd.
>> And that will only do ad dc specific stuff.
>> And the current mode would only work on domain members?
> Fine with me. Also, if an admin would really like to have a certain gpo apply to the ADDC, they can always re-enable it with `samba-tool gpo cse register`.

I think some ad dc specific extensions would be registered and enabled by default.

And something like a 'samba-tool gpo cse register --all-available' could be used to
restore the old behavior. Also a 'samba-tool gpo cse register --all-for-ad-dc'...

>>
>> Also note this seems to fail badly for users not from the primary domain...
> I wasn't aware of that. What error are you getting?

As far as I can see we're using the machine credentials to fetch the user gpos
and try fetch them from a dc in the servers domain not in the users domain.

I think windows fetch user gpos as user from the users domain.
I also think the servers machine credentials may not have permissions to fetch the users gpos,
even in the same domain.

I also saw that we use the account name as key into the apply logs (and maybe other stuff),
I guess we want to use the account sid instead as that can never change, while the name can.

Any idea how we can go this such a change:

> diff --git a/source4/scripting/bin/samba-gpupdate b/source4/scripting/bin/samba-gpupdate
> index 503a299a6b03..7b882575747c 100755
> --- a/source4/scripting/bin/samba-gpupdate
> +++ b/source4/scripting/bin/samba-gpupdate
> @@ -30,29 +30,7 @@ sys.path.insert(0, "bin/python")
>  import optparse
>  from samba import getopt as options
>  from samba.gp.gpclass import apply_gp, unapply_gp, GPOStorage, rsop
> -from samba.gp.gp_sec_ext import gp_krb_ext, gp_access_ext, gp_privilege_rights_ext
>  from samba.gp.gp_ext_loader import get_gp_client_side_extensions
> -from samba.gp.gp_scripts_ext import gp_scripts_ext, gp_user_scripts_ext
> -from samba.gp.gp_sudoers_ext import gp_sudoers_ext
> -from samba.gp.vgp_sudoers_ext import vgp_sudoers_ext
> -from samba.gp.gp_smb_conf_ext import gp_smb_conf_ext
> -from samba.gp.gp_msgs_ext import gp_msgs_ext
> -from samba.gp.vgp_symlink_ext import vgp_symlink_ext
> -from samba.gp.vgp_files_ext import vgp_files_ext
> -from samba.gp.vgp_openssh_ext import vgp_openssh_ext
> -from samba.gp.vgp_motd_ext import vgp_motd_ext
> -from samba.gp.vgp_issue_ext import vgp_issue_ext
> -from samba.gp.vgp_startup_scripts_ext import vgp_startup_scripts_ext
> -from samba.gp.vgp_access_ext import vgp_access_ext
> -from samba.gp.gp_gnome_settings_ext import gp_gnome_settings_ext
> -from samba.gp.gp_cert_auto_enroll_ext import gp_cert_auto_enroll_ext
> -from samba.gp.gp_firefox_ext import gp_firefox_ext
> -from samba.gp.gp_chromium_ext import gp_chromium_ext, gp_chrome_ext
> -from samba.gp.gp_firewalld_ext import gp_firewalld_ext
> -from samba.gp.gp_centrify_sudoers_ext import gp_centrify_sudoers_ext
> -from samba.gp.gp_centrify_crontab_ext import gp_centrify_crontab_ext, \
> -                                             gp_user_centrify_crontab_ext
> -from samba.gp.gp_drive_maps_ext import gp_drive_maps_user_ext
>  from samba.credentials import Credentials
>  from samba.gp.util.logging import logger_init
>  
> @@ -100,34 +78,8 @@ if __name__ == "__main__":
>      machine_exts, user_exts = get_gp_client_side_extensions(lp.configfile)
>      gp_extensions = []
>      if opts.target == 'Computer':
> -        gp_extensions.append(gp_access_ext)
> -        gp_extensions.append(gp_privilege_rights_ext)
> -        gp_extensions.append(gp_krb_ext)
> -        gp_extensions.append(gp_scripts_ext)
> -        gp_extensions.append(gp_sudoers_ext)
> -        gp_extensions.append(vgp_sudoers_ext)
> -        gp_extensions.append(gp_centrify_sudoers_ext)
> -        gp_extensions.append(gp_centrify_crontab_ext)
> -        gp_extensions.append(gp_smb_conf_ext)
> -        gp_extensions.append(gp_msgs_ext)
> -        gp_extensions.append(vgp_symlink_ext)
> -        gp_extensions.append(vgp_files_ext)
> -        gp_extensions.append(vgp_openssh_ext)
> -        gp_extensions.append(vgp_motd_ext)
> -        gp_extensions.append(vgp_issue_ext)
> -        gp_extensions.append(vgp_startup_scripts_ext)
> -        gp_extensions.append(vgp_access_ext)
> -        gp_extensions.append(gp_gnome_settings_ext)
> -        gp_extensions.append(gp_cert_auto_enroll_ext)
> -        gp_extensions.append(gp_firefox_ext)
> -        gp_extensions.append(gp_chromium_ext)
> -        gp_extensions.append(gp_chrome_ext)
> -        gp_extensions.append(gp_firewalld_ext)
>          gp_extensions.extend(machine_exts)
>      elif opts.target == 'User':
> -        gp_extensions.append(gp_user_scripts_ext)
> -        gp_extensions.append(gp_user_centrify_crontab_ext)
> -        gp_extensions.append(gp_drive_maps_user_ext)
>          gp_extensions.extend(user_exts)
>  
>      if opts.rsop:

Also change get_gplog() to take the sid (maybe in addition)
and use the sid as primary index.

With all that how can we make that compatible with current releases?
Any idea?

metze

