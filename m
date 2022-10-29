Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F13D612234
	for <lists+samba-technical@lfdr.de>; Sat, 29 Oct 2022 12:29:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=adFBSwKov0Wg/jq9dfy/z65nmtssNVDEpsat6PwUq/Y=; b=bcd6VHDhaBC3FG5BOJEAhwLv6E
	OBNet9euEKIj1zzpG9Ea2iXpjLECSJoS16fENi50EiF5hFeOOohJAyxjFPAZ58ScMbaaATts/ZkqJ
	4lzGm28TdENLd6k6kimiaZWddM5khdiMlrRFefxZFF9AQVjpUGVe2f69toYUgazYIaRgxmLUNDUn5
	DlHKSY4x5nm0gBNh3KxLglw7f3YmcHWRIzUV6p4/FHZs8tvDix/H1glHjZuKbFQiwmFjIT9YIuZcE
	pea+bNx5z6FZBPttu8bUO1m+7tSJWwFFS2KO5OK/uImioR1mnSWwCT/XuIQHwwbKZMPxWoGZnn2BB
	8QXYroFQ==;
Received: from ip6-localhost ([::1]:22644 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ooj5M-0075kd-SQ; Sat, 29 Oct 2022 10:29:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44588) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ooj5G-0075kU-Pe
 for samba-technical@lists.samba.org; Sat, 29 Oct 2022 10:29:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=adFBSwKov0Wg/jq9dfy/z65nmtssNVDEpsat6PwUq/Y=; b=KGs+XiHXf3qzuPK3JiXYP+ETF3
 R6EQj/Z3ZZs3zWSIBCh3GtZ+boh1UYeZcWS4Lx92SWbgcDfTYQXqgNetGl+hOqMuy49sGgzIATGsT
 LP0zZjhi51IZN8T3D59pbeAu2W65ylp8VAcB4tA6OQ10o/cgLU74DPj7R8slzlerz5BVQXUCFoqo4
 kYU+tpaK7dGrxUMSMDX7e3yHCcPBA3uglz7eJk3mIDzJkW6gQzO8epvkdAlK1JK3fiCgfyQsfaUzB
 eu+G9+WFUEkTKfEEpPb3pg1hgPA0sesmWldag6ZIeAN95Qu/Nd9ZKzYASQhMrtDWYhyRvcaYIE4vh
 U4OOkJSvCUX7eJdN9h5B/qunNuPUGWHM8M8Q+/qprJccuppbuDlhjOgGfp7gp+bncoRpM+sTR+K+Q
 nEF4scL2mG00/9kpjbFgYYfvmHAh5Hlwy6NIoZV9ZVnBRdBxpmecYUPnlcnffH21AiECys5xF3Pya
 TCvfCIUgtafVMUrp+kVe65+2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ooj5F-006K48-T7; Sat, 29 Oct 2022 10:28:57 +0000
Message-ID: <721dd560-87f9-5f26-be88-0974fb520554@samba.org>
Date: Sat, 29 Oct 2022 12:28:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: vfswrap_getxattrat_do_async and unshare(CLONE_FS)
Content-Language: en-US
To: Jeremy Allison <jra@samba.org>, Florian Weimer <fweimer@redhat.com>
References: <87czag28up.fsf@oldenburg.str.redhat.com>
 <Y1cOvCrfk4QEaE4m@jeremy-acer>
In-Reply-To: <Y1cOvCrfk4QEaE4m@jeremy-acer>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Florian,

> On Mon, Oct 24, 2022 at 11:46:22PM +0200, Florian Weimer via samba-technical wrote:
>> As far as I can tell, vfswrap_getxattrat_do_async relies on
>> unshare(CLONE_FS) to do fgetxattrat emulation with a thread-local fchdir
>> and getxattr.  There do not seem to be any other uses in the sources.
>>
>> I think the more usual way to emulate the missing fgetxattrat system
>> call is to open the file with openat and O_PATH, and then use getxattr
>> on the synthetic path under /proc/self/fd.  While these paths present as
>> symbolic links, they actually are not, so there is no race possible.
>> (fgetxattr cannot operate on the open file descriptor directly.)
>>
>> Why wasn't the /proc-based approach chosen for Samba?  It looks a bit
>> simpler to implement, and does not do strange things to the process
>> state behind glibc's back.
> 
> As I recall it was done that way as there are various OEMs with fuse-based
> filesystems that are very slow on fetching EA's, which we have to do
> on every directory entry returned. Doing this inside a pthread using
> unshare(CLONE_FS) to keep a per-thread directory was found to allow
> these filesystems to have a decent performance.

Yes, open/getxattr/close for each directory element was avoided
for performance reasons at the time we developed it.

> This was before the VFS-rewrite to use fd's everywhere as I recall,
> so it's possible it may no longer be required. But I'd wait for
> Metze to chime in here as he was deeply involved in this I think.

Yes, looking the current code shows that
vfswrap_getxattrat_do_async already uses vfswrap_fgetxattr(),
which is fd-based and actually uses /proc/self/fd if
fsp->fsp_flags.have_proc_fds is set, and that is never
false if per_thread_cwd_supported() is true.

So I think could replace per_thread_cwd_supported() in
vfswrap_getxattrat_send() with fsp->fsp_flags.have_proc_fds
and actually remove per_thread_cwd_activate() and set_thread_credentials()
from vfswrap_getxattrat_do_async(). This would also mean we can
also go async within restricted
containers which block the whole unshare() syscall (independed of the passed flags).

(But I haven't tested it yet...)

metze



