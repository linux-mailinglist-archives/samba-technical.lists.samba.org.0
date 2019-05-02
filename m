Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1773911289
	for <lists+samba-technical@lfdr.de>; Thu,  2 May 2019 07:18:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=iO1HHjT9MfB+rk2krZXpON6c0hKPx/5fOIR+nUe8jqc=; b=HIqTzZraaAmWwXEZzN9mIREkoY
	3WCWEKWdwfn8IE89eLjSo9JX0CMs/fGGeWAHyOoOsyg5HMeJvPp0LmwNxTIDL06yYGTi4ealHsmre
	QnwYzoLL0lleD8w04F18LvxLxQEDXcxeJiM83Me8/OUIg0y2D3j/+8+ZA95vD1TTT7Hxb7ne8yx/U
	/kWHCIcwWDV2El3neq+plnlEENLS0EbQVVpmE1FXzdS1QQXv9tLcdSoPaV7P2HOzMJn+NskbGqejf
	wLms80tFAi7S/Tr5DEd6glyq6514179f+K9PtkZn5yOvO7EEzSE7ThDCeEnf/mvaxNH2tydeqG0oa
	nuDc3XsA==;
Received: from localhost ([::1]:63828 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hM46K-001vxU-7S; Thu, 02 May 2019 05:17:44 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:34560) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim) id 1hM46F-001vxN-1W
 for samba-technical@lists.samba.org; Thu, 02 May 2019 05:17:42 +0000
Received: from [IPv6:2404:130:0:1000:ed06:1c1d:e56c:b595] (unknown
 [IPv6:2404:130:0:1000:ed06:1c1d:e56c:b595])
 (Authenticated sender: timbeale@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 5076C81615; 
 Thu,  2 May 2019 17:17:28 +1200 (NZST)
Subject: Re: dns_hub lingers
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 Samba Technical <samba-technical@lists.samba.org>
References: <b49cf3d8-11a8-5972-9ccd-ef9c62591179@catalyst.net.nz>
Openpgp: preference=signencrypt
Message-ID: <cd239312-98e0-6868-b547-aff94f4674e5@catalyst.net.nz>
Date: Thu, 2 May 2019 17:17:27 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b49cf3d8-11a8-5972-9ccd-ef9c62591179@catalyst.net.nz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Tim Beale via samba-technical <samba-technical@lists.samba.org>
Reply-To: Tim Beale <timbeale@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I had a look at this a while ago. I think I came to the conclusion that
it was only CTRL+C case that did this and the clean shutdown/pipe-close
worked fine.

It looks like in the CTRL+C case, the samba processes disappear
immediately, and so the usual graceful teardown_env_terminate() fails, e.g.

^Cteardown_env(vampire_dc)
Can't find pid for destination 'samba'
'./bin/smbcontrol samba shutdown
--configfile=/home/timbeale/code/clean/samba/st/vampire_dc/etc/smb.conf'
failed with '256'
samba child process 143771, died with signal 2, without coredump
/home/timbeale/code/clean/samba/selftest/selftest.pl: PID[143645]: Got
SIGPIPE teardown environments.

It might be because the CTRL+C signal goes to the entire process group,
which just kills samba. But perhaps the signal isn't getting to dns_hub,
or python3 handles the SIGINT slightly differently?

On 2/05/19 3:26 PM, Douglas Bagnall via samba-technical wrote:
> I find that our newest and simplest dns server still has a few
> surprises.
>
> After a number of `make test`s, I end up with several dns_hub.py
> processes hanging around (according to `ps faux |grep dns_hub`).
>
> Looking inside, I see:
>
> (gdb) py-bt
> Traceback (most recent call first):
>   <built-in method acquire of _thread.lock object at remote 0x7f32fb272e18>
>   File "/usr/lib/python3.6/threading.py", line 1072, in
> _wait_for_tstate_lock
>     elif lock.acquire(block, timeout):
>   File "/usr/lib/python3.6/threading.py", line 1056, in join
>     self._wait_for_tstate_lock()
>   File "/usr/lib/python3.6/threading.py", line 1294, in _shutdown
>     t.join()
>
> I can look into this eventually if no dns_hub experts leap forward.
> Garming thinks it has something to do with hitting control-C.
>
> Douglas
>

