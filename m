Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8E1290734
	for <lists+samba-technical@lfdr.de>; Fri, 16 Oct 2020 16:31:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=fUWm5BmDKhgBAVFrloOUMFmhEPAFwgFScqsLeW5Tofk=; b=FXFikCtlnN4PfPpNbpCgXWYCBx
	UARzQdRWBEOKvseEWCvV5A5Kl36FjCiHGTVpeoRhAu3rhmmc0h+18GZEOtTyJGrfHSrpZ8ikRNjPu
	V7rh6b2Njpx/WFATcNOyBV7mITlbN8B9reuOlKER5X26kgdNG2XZ7G/hSxk/+v41WlfzMK/jfZVPB
	NIaamj9EfvMOtlRQgNPXkWNwEuPybhpWiPmbmJCeTjeXrCKfQNYydrSZjdtR7UTKN8QaXP+94dS6v
	ZtgA0IF3L9U4+gt5CHhpesC/QwCsH0mh4bvm8kJ8mCL1fLKcTMpZ2nBmsxMgvXCyHlgI46Hw63E51
	ZdB2umGQ==;
Received: from ip6-localhost ([::1]:46530 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTQkM-00CPdl-L5; Fri, 16 Oct 2020 14:30:19 +0000
Received: from p3plsmtpa06-01.prod.phx3.secureserver.net
 ([173.201.192.102]:57818) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kTQkC-00CPde-Jq
 for samba-technical@lists.samba.org; Fri, 16 Oct 2020 14:30:11 +0000
Received: from [192.168.0.116] ([71.184.94.153]) by :SMTPAUTH: with ESMTPSA
 id TQhwkPvAWXReoTQhwkYFrS; Fri, 16 Oct 2020 07:27:49 -0700
X-CMAE-Analysis: v=2.3 cv=DKHxHBFb c=1 sm=1 tr=0
 a=vbvdVb1zh1xTTaY8rfQfKQ==:117 a=vbvdVb1zh1xTTaY8rfQfKQ==:17
 a=IkcTkHD0fZMA:10 a=hGzw-44bAAAA:8 a=pGLkceISAAAA:8 a=SEc3moZ4AAAA:8
 a=iox4zFpeAAAA:8 a=yMhMjlubAAAA:8 a=hNOTfydlAAAA:8 a=ySJjVz2esI22uv7vTAIA:9
 a=QEXdDO2ut3YA:10 a=HvKuF1_PTVFglORKqfwH:22 a=5oRCH6oROnRZc2VpWJZ3:22
 a=WzC6qhA0u3u7Ye7llzcV:22 a=fZunMKNLB757I4m4HZ3M:22
X-SECURESERVER-ACCT: tom@talpey.com
Subject: Re: [PATCH][SMB3.1.1] Add defines for new signing context
To: ronnie sahlberg <ronniesahlberg@gmail.com>,
 Steve French <smfrench@gmail.com>
References: <CAH2r5mtwBHTk-Xoeuo+RbgNwiNw-cWTAhdy1YG5y+vXnNDSv4w@mail.gmail.com>
 <bd8f21ed-5fd4-0974-f15a-16d2f3ee607f@samba.org> <87r1q3hixr.fsf@suse.com>
 <827fd43f-40a9-9480-a6b9-aea1fa69090c@talpey.com>
 <CAH2r5mt3t=FHVd8RtCyrzY6TUKb+rGENENXbKJBgUdq4T4Qe6Q@mail.gmail.com>
 <CAH2r5mu72VSPFhiLjL3YUtStXc1=B5SBP86+A5vEWFhLFyOJBw@mail.gmail.com>
 <CAN05THRAZnea1NUW7-h5jHsQ+yUpvxO-5KHGaFgKB87JxmWBqg@mail.gmail.com>
Message-ID: <55b0a562-b6cc-b6d4-65c7-b642ce08cc4b@talpey.com>
Date: Fri, 16 Oct 2020 10:27:49 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CAN05THRAZnea1NUW7-h5jHsQ+yUpvxO-5KHGaFgKB87JxmWBqg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfIxjPAgA97wmOXrhr3HAbnhORhugIuEaA16Agw7hcROM4DjCbRAho1qq2TuemZBcabvIgUEW8dngv6lItCFwLTQstQB0nAwkOeR4UqMQ8MrdsH9SbDVt
 7lyt0bci0F25I91F1VlLPZC6OPYv0rhPhErkoX8+DUk6+R14zJ0pzrm+FePKw/CSshUie/qv9NtBjymjb6cvIjWWyM2cAaYE3rK7XqkXZzB40cdAX9t4k79d
 v7n3Kilb2A6YZxgBl66lupHN2BuIhm/vTKlmg9bAA1VfBMeHQyh1IOm+sCNaitcM1FpR6V1kzl+x+adAkm2AO8wQ1MWCusJiMWxI/XuX+p4=
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
From: Tom Talpey via samba-technical <samba-technical@lists.samba.org>
Reply-To: Tom Talpey <tom@talpey.com>
Cc: Stefan Metzmacher <metze@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Aur=c3=a9lien_Aptel?= <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Indeed yes, my point is that until/unless Microsoft indicates
the new signing context is committed to the protocol, it's
premature to bake it into Linux, or anywhere else. Speaking
from experience, things have been changed or removed at some
very late dates, in fact.

While I have the floor, and just a personal opinion, I feel
there is a huge and confusing proliferation of module options
and mount flags creeping into cifs.ko over time here. Is this
really a good idea?

Tom.

On 10/16/2020 2:11 AM, ronnie sahlberg wrote:
> Looks good, but I think Tom's point is we should not put this in
> upstream until the feature is officially launched.
> In  wireshark, we can add these things immediately since any capture
> files with these parameters will continue to exist forever.
> See wireshark still supports pre-RFS versions of iSCSI.
> But for cifs.ko we might want to wait sending to Linus until it is
> officially released in a consumer version of windows.
> 
> Lets just look at SMB2.PDF and all the bitfields/flags that specify a
> feature with description and then the comment that it is not used,
> clients should set it to 0 and servers must ignore the flag. Things
> can change until official release.
> 
> 
> 
> On Fri, Oct 16, 2020 at 3:50 PM Steve French via samba-technical
> <samba-technical@lists.samba.org> wrote:
>>
>> Here is a patch to add a module load parm that is turned off by
>> default to allow users to enable it for experimentation
>>
>> # ls /sys/module/cifs/parameters/
>> CIFSMaxBufSize    cifs_min_small           enable_oplocks
>> cifs_max_pending  disable_legacy_dialects  enable_signing_negcontext
>> cifs_min_rcv      enable_gcm_256           require_gcm_256
>>
>> # cat /sys/module/cifs/parameters/enable_signing_negcontext
>> N
>>
>> On Thu, Oct 15, 2020 at 11:50 PM Steve French <smfrench@gmail.com> wrote:
>>>
>>>> suggest wrapping this context and the integrity algs in some kind of conditional
>>>
>>> I have a couple patches to send the context (which I haven't merged
>>> yet, because, similar to what you suggested, I wanted to make sure
>>> they were disabled by default).
>>>
>>> Tentative plan was to have them disabled by default, and sending the
>>> new context can be enabled for testing by a module parameter (e.g.
>>> "echo 1 >  /sys/modules/cifs/parameters/enable_signing_context"  or
>>> some similar config variable name)
>>>
>>> On Thu, Oct 15, 2020 at 1:15 PM Tom Talpey <tom@talpey.com> wrote:
>>>>
>>>> On 10/12/2020 5:50 AM, Aurélien Aptel wrote:
>>>>> Patch LGTM
>>>>>
>>>>> Reviewed-by: Aurelien Aptel <aaptel@suse.com>
>>>>>
>>>>> Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
>>>>>> This isn't in MS-SMB2 yet.
>>>>>>
>>>>>> Is this AES_128?
>>>>>
>>>>> This is returned in latest Windows Server Insider builds but it's not
>>>>> documented yet.
>>>>>
>>>>> https://www.microsoft.com/en-us/software-download/windowsinsiderpreviewserver
>>>>>
>>>>> I've asked dochelp about it during the SDC plugfest and they gave me
>>>>> this:
>>>>>
>>>>>       The new ContextType is:
>>>>>       SMB2_SIGNING_CAPABILITIES 0x0008
>>>>>       The Data field contains a list of signing algorithms.
>>>>>       •    It adds a new negotiate context, which enables SMB to decouple signing algorithms from dialects. E.g. if both client and server supports it, a session may use HMAC-SHA256 with SMB 3.1.1.
>>>>>       •    It adds the AES-GMAC algorithm.
>>>>>
>>>>>       SigningAlgorithmCount (2 bytes): Count of signing algorithms
>>>>>       SigningAlgorithms (variable): An array of SigningAlgorithmCount 16-bit integer IDs specifying the supported signing algorithms.
>>>>>
>>>>>       The following IDs are assigned:
>>>>>       0 = HMAC-SHA256
>>>>>       1 = AES-CMAC
>>>>>       2 = AES-GMAC
>>>>>
>>>>>
>>>>> I've been CCed in a Microsoft email thread later on and it seems to be
>>>>> unclear why this was missed/wasn't documented. Maybe this is subject to
>>>>> change so take with a grain of salt.
>>>>
>>>> Just curious if you've heard back on this. Insider builds will sometimes
>>>> support things that don't make it to the release. Even Preview docs can
>>>> change. However, AES_GMAC has been on the radar since 2015 (*) so
>>>> perhaps the time has come!
>>>>
>>>> I'd suggest wrapping this context and the integrity algs in some kind of
>>>> conditional, in case this is delayed...
>>>>
>>>> Tom.
>>>>
>>>> (*) slide 29+
>>>> https://www.snia.org/sites/default/files/SDC15_presentations/smb/GregKramer_%20SMB_3-1-1_rev.pdf
>>>
>>>
>>>
>>> --
>>> Thanks,
>>>
>>> Steve
>>
>>
>>
>> --
>> Thanks,
>>
>> Steve
> 
> 

