Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E5CB48FE9
	for <lists+samba-technical@lfdr.de>; Mon,  8 Sep 2025 15:40:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=/5dgSjcxX1ybY2x6iCCKwm2uHVKz4C7oNWU8l7C3Yjg=; b=bAI8GIV1ly7tJp+XgE34MC8Czc
	wfmW356drRdbsSQL2/2q1m5mOkomSGV7uP8M1aJ0WJ4xAJSmCAoGv8u2S3NDDcj5OJb2cONtwzl17
	X7/w5f+/7JcC45etBUASicNH3Bgu26uYhLMm9dnvQToNMsVx+9FxcbNmEnwtTWiwM/S/xbfC/sC/z
	P5IHnO2wPUA/Dw2YSVIqF2vkfx/88cYiIon4XNasFuSQaoloRvPaqUtdJgqm6c1mVHe4793mZ4ej0
	fA0jBaqjaUrdNvStWzR32fQ67YbOJXOC6W9dZuc/NgLkfHVTwc5TRVduGEeeJkRub8YrWLSQvX1t4
	T3lhjdkA==;
Received: from ip6-localhost ([::1]:43598 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uvc6L-003Jri-Dc; Mon, 08 Sep 2025 13:40:09 +0000
Received: from air.basealt.ru ([193.43.8.18]:45576) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uvc6G-003JrZ-Vo
 for samba-technical@lists.samba.org; Mon, 08 Sep 2025 13:40:07 +0000
Received: from [10.64.128.185] (unknown [193.43.9.250])
 (Authenticated sender: alekseevamo)
 by air.basealt.ru (Postfix) with ESMTPSA id 036482337B;
 Mon,  8 Sep 2025 16:24:29 +0300 (MSK)
Message-ID: <bb31a447-3092-4902-ba38-e5e16f1986dd@altlinux.org>
Date: Mon, 8 Sep 2025 17:24:31 +0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/smb/client/fs_context: Add hostname option for CIFS
 module to work with domain-based dfs resources with Kerberos authentication
To: Steve French <smfrench@gmail.com>
References: <20250516152201.201385-1-alxvmr@altlinux.org>
 <43os6kphihnry2wggqykiwmusz@pony.office.basealt.ru>
 <3d3160fd-e29d-495d-a02e-e28558cfec1a@altlinux.org>
 <CAH2r5mtG5pwFMRtu3EeXKPBdq0LJwjt84SbGtL0J4QuCg+AsgQ@mail.gmail.com>
 <CAH2r5msnTMCHJ9kZmFWCbUUUnejOLv8mzGussaidc3yj3nk+qQ@mail.gmail.com>
 <8f2ad82d-0dd4-4195-b414-59f25f859a9e@altlinux.org>
 <CAH2r5mvDa8E8NKNHevoWYARY_52DJ+WQX3oetYw-pwysMyAKYQ@mail.gmail.com>
Content-Language: en-US, ru
In-Reply-To: <CAH2r5mvDa8E8NKNHevoWYARY_52DJ+WQX3oetYw-pwysMyAKYQ@mail.gmail.com>
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
From: Maria Alexeeva via samba-technical <samba-technical@lists.samba.org>
Reply-To: alxvmr@altlinux.org
Cc: pc@manguebit.com, linux-cifs@vger.kernel.org,
 Ivan Volchenko <ivolchenko86@gmail.com>, samba-technical@lists.samba.org,
 Tom Talpey <tom@talpey.com>, Vitaly Chikunov <vt@altlinux.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Good day!

Could you please let me know if you have managed to find the messages 
with comments/feedback? This is important for us to make the 
corresponding changes to the proposed patches.

On 7/31/25 18:00, Steve French via samba-technical wrote:
> I don't have any strong opinion on: "dfs_server_hostname" vs
> "dfs_domain_hostname" whichever makes more sense.
> 
> I will look to see if I can find any more threads on this in earlier email
> 
> On Wed, Jul 30, 2025 at 11:54 AM Maria Alexeeva <alxvmr@altlinux.org> wrote:
>>
>> Steve,
>> It seems some of the discussion with review comments fell outside this
>> thread (I can only find vt@altlinux.org Vitaly Chikunov's remarks).
>> Could you please point me to where the rest of the feedback can be
>> found (e.g., about fixing the noisy warning the patch adds and
>> other comments)?
>>
>> An updated patch for fs/smb/client/fs_context has been prepared, renaming
>> the option to dfs_domain_hostname. There's suggestion to further rename
>> it to dfs_server_hostname - what are your thoughts on this?
>>
>> The patches will follow in subsequent messages.
>>
>> Thanks!
>>
>> On 7/25/25 02:50, Steve French via samba-technical wrote:
>>> Maria,
>>> Since this looks like it depends on a cifs-utils change, can you
>>> update your kernel patch with review comments (e.g. changing mount
>>> parm to "dfs_domain_hostname", and there were at least two others in
>>> the thread, e.g. fixing the noisy warning that the patch adds) and
>>> then show the cifs-utils change, so we can make the upcoming merge
>>> window.
>>>
>>> On Thu, Jul 24, 2025 at 5:14 PM Steve French <smfrench@gmail.com> wrote:
>>>>
>>>> I will update the mount parm name, similar to what Tom suggested to
>>>> "dfs_domain_hostname" to be less confusing.
>>>>
>>>> Let me know if you had a v2 of the patch with other changes

