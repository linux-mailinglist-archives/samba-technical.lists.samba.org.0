Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C84479D639
	for <lists+samba-technical@lfdr.de>; Tue, 12 Sep 2023 18:27:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=/asLzpyM7NNQgpxqaNaaJnM9RwltzfxModD3ti8v2kU=; b=u8d/2LA5I1J2MC77VkDOcsZM4p
	FrvDmBGc+fM3ttwq2an9pBktvg7b8JsnPJaxl/CWdSvl1rrekvEhxCLPbSjwp69HaIcSjMjQ9lKFk
	dYI3gShDf7SE2a6shhc+eQ5HAAo7KlczPD/Op1v167o3bpRWGnV0z4SABF3rbZWpGRiwEacR1aSuo
	ypix4su7jmVQxAS4n73+0bVLWeAMSfLh2S1Pi4/GJuFHQ9+cjfHC1FaCQsYqb4GZ1elb1HbiGVMb6
	FqtLKLQ3vX4nRhXXhgJOoumpLf395rBrz06sMoinsvMPhSWiFKylrbMSMI0Ucv/3UpDKZ3e5L4p0I
	fLf4SftA==;
Received: from ip6-localhost ([::1]:63704 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qg6De-003bz8-VC; Tue, 12 Sep 2023 16:26:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10904) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qg6DZ-003bye-0j
 for samba-technical@lists.samba.org; Tue, 12 Sep 2023 16:26:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=/asLzpyM7NNQgpxqaNaaJnM9RwltzfxModD3ti8v2kU=; b=VH9Sda8+40LKH8FhZNdRHVG9UB
 HJq4IoO5b9O/oayTlkf4kCtMBTyullfGYaxRAsxcEHIHORQ93LlLPG37qOyKy6bGP8bEDup6Ksvht
 riGhHKpNU2bQDOR6M3kIbnXZuHIEWpetckFg1r3eRyVfIj96MT3WiWTutt8N1adaaeiIM2Ut+tpad
 tU06MbweTiLo77mhkkAeycMbIhX4fPgQl11jo41IhVFmIoOm/zWBEXviP1pActumqojljP0m34k42
 FTMTKtMc0Cd0KaskxeEDYo8+P4XTcyECsw91ePY0fYXNM4yD8+3EFReTIDyQwr0UzE6Fy6/xuBmHt
 fTRZ2eVb62y2nB568PbnoFPCv/YjGOZsDgI7OFXr8W94yezUtyX3nMqmbK8aY02RJL5QR01U/p66J
 tXscaO+NlEXRkxfDK9OBsPCDi1vS5shwmwDc+StgR5/d+xRQYUdy7wrDhc8zJKKkP76QAFob7npun
 VcB0joAaczv8c83SAz5AFukJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qg6DX-00D9eg-25; Tue, 12 Sep 2023 16:26:24 +0000
Date: Tue, 12 Sep 2023 09:26:20 -0700
To: Richard Sharpe <realrichardsharpe@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>
Subject: Re: One simple stupid users trick owns all your bases ...
Message-ID: <ZQCRLDyBaV9ixuec@jeremy-HP-Z840-Workstation>
References: <CACyXjPx2amrwUZRYoMZOu+XGshLCRQtEDGsx_dfVVoLVP=VTbw@mail.gmail.com>
 <ZPIZij6tviIwnAP+@jeremy-acer>
 <CACyXjPyFJ3qTGRrHZOi8Gqn-R5j0mq61HG2exFQFQZyDfbikPQ@mail.gmail.com>
 <ZPIne6H8344yl8yR@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZPIne6H8344yl8yR@jeremy-acer>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Sep 01, 2023 at 11:03:39AM -0700, Jeremy Allison via samba-technical wrote:
>On Fri, Sep 01, 2023 at 10:15:22AM -0700, Richard Sharpe wrote:
>>On Fri, Sep 1, 2023 at 10:04 AM Jeremy Allison <jra@samba.org> wrote:
>>>
>>>On Fri, Sep 01, 2023 at 09:21:09AM -0700, Richard Sharpe via samba-technical wrote:
>>>>Hi folks,
>>>>
>>>>I didn't follow the instructions carefully enough.
>>>>
>>>>I set up resolv.conf to point at 127.0.0.1 and an upstream nameserver
>>>>(10.20.1.100).
>>>>
>>>>During provisioning that created an entry of 'dns resolver = 127.0.0.1'.
>>>>
>>>>That resulted in the following crash. Looks like a bug.
>>>>
>>>>Provisioning should not use any of the aliases for the current system
>>>>as forwarders.
>>>>
>>>>In addition, perhaps the code should not crash if it gets a timeout.
>>>>
>>>>4.19.0rc4.
>>>
>>>Can you add a "panic action = /bin/sleep 99999999"
>>>and catch it in gdb. Knowing *exactly* what line
>>>it goes down on will help. A lot :-).
>>
>>OK:
>>
>>#0  0x00007fa0f256dd98 in nanosleep () from /lib64/libc.so.6
>>#1  0x00007fa0f256dc9e in sleep () from /lib64/libc.so.6
>>#2  0x00007fa0f8e1c13b in log_stack_trace () at ../../lib/util/fault.c:306
>>#3  0x00007fa0f8e1c33f in smb_panic_log (
>>   why=why@entry=0x7ffc3acd6050 "Signal 11: Segmentation fault")
>>   at ../../lib/util/fault.c:195
>>#4  0x00007fa0f8e1c4b3 in smb_panic (
>>   why=why@entry=0x7ffc3acd6050 "Signal 11: Segmentation fault")
>>   at ../../lib/util/fault.c:206
>>#5  0x00007fa0f8e1c619 in fault_report (sig=11) at ../../lib/util/fault.c:83
>>#6  sig_fault (sig=11) at ../../lib/util/fault.c:94
>>#7  <signal handler called>
>>#8  0x00007fa0f7b90049 in dns_cli_request_udp_done (subreq=<optimized out>)
>>   at ../../libcli/dns/dns.c:497
>>#9  0x00007fa0f7b9134d in dns_udp_request_done (subreq=0x618001b18900)
>>   at ../../libcli/dns/dns.c:157
>>#10 0x00007fa0f9764929 in tdgram_recvfrom_done (subreq=0x61800533cd00)
>>   at ../../lib/tsocket/tsocket.c:239
>>#11 0x00007fa0f976b1f7 in tdgram_bsd_recvfrom_handler (
>>   private_data=<optimized out>) at ../../lib/tsocket/tsocket_bsd.c:1186
>>#12 0x00007fa0f9769c18 in tdgram_bsd_fde_handler (ev=<optimized out>,
>>   fde=<optimized out>, flags=<optimized out>, private_data=<optimized out>)
>>   at ../../lib/tsocket/tsocket_bsd.c:910
>>#13 0x00007fa0f3dc53a7 in tevent_common_invoke_fd_handler ()
>
>tdgram_bsd_recvfrom_recv() calls tsocket_simple_int_recv()
>which should set:
>
>        case TEVENT_REQ_TIMED_OUT:
>                *perrno = ETIMEDOUT;
>                return -1;
>
>tdgram_recvfrom_done() looks like:
>
>static void tdgram_recvfrom_done(struct tevent_req *subreq)
>{
>        struct tevent_req *req = tevent_req_callback_data(subreq,
>                                 struct tevent_req);
>        struct tdgram_recvfrom_state *state = tevent_req_data(req,
>                                              struct tdgram_recvfrom_state);
>        ssize_t ret;
>        int sys_errno;
>
>        ret = state->ops->recvfrom_recv(subreq, &sys_errno, state,
>                                        &state->buf, &state->src);
>        if (ret == -1) {
>                tevent_req_error(req, sys_errno);
>                return;
>        }
>
>        state->len = ret;
>
>        tevent_req_done(req);
>}
>
>state->ops->recvfrom_recv() should be tdgram_bsd_recvfrom_recv()
>which should be returning -1 in the ETIMEDOUT Case.
>
>So it should never get to:
>
>lib/tsocket/tsocket.c:239
>
>:-(. Looking under gdb is the next step.

Did you find out what the cause of this one is ?

I lost the thread (sorry :-).

Jeremy.

