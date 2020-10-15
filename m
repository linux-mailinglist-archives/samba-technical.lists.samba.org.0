Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1143B28F849
	for <lists+samba-technical@lfdr.de>; Thu, 15 Oct 2020 20:18:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=xhgVD/E3cPtRpj7ZT0YXcSBZWOD5DiEjM0C4lcbUvI8=; b=fcamZf2t4mQOtVJ3tE1WEInmYG
	0wiRpYqbNyMf/i33kDhjrn0YC5ikzDg+/5o/oGLMd/tC3DiczMNX/XzZ8R8A6IjYeLxu0Urowu5OF
	mj3gptjYAO0dR6l57MRF75nP0VWvWcOLtECM1wUTOjOE8EpexFd7YTwdoi3QMn2/XvnhHSEj+pb5X
	IG2tS1yOTzXNYTYNvdglnfZS850D1S90riujHbokeVJNfXCWvYSB0cxjYkpZ6yeLBB2lQbNzGWpGi
	hfwBl/z3SfD3NSA0fKEjpw+5bz1Ubx4jtZV9OSKwV/UIJjsp89qQF70t0cNUQtuzXFFsLrs6troBm
	+tfdF1KA==;
Received: from ip6-localhost ([::1]:55820 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kT7p7-00CIa2-D9; Thu, 15 Oct 2020 18:17:57 +0000
Received: from p3plsmtpa07-05.prod.phx3.secureserver.net
 ([173.201.192.234]:52804) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kT7p2-00CIZv-Cc
 for samba-technical@lists.samba.org; Thu, 15 Oct 2020 18:17:55 +0000
Received: from [192.168.0.116] ([71.184.94.153]) by :SMTPAUTH: with ESMTPSA
 id T7mlk50kils90T7mmkWp2O; Thu, 15 Oct 2020 11:15:32 -0700
X-CMAE-Analysis: v=2.3 cv=QfEYQfTv c=1 sm=1 tr=0
 a=vbvdVb1zh1xTTaY8rfQfKQ==:117 a=vbvdVb1zh1xTTaY8rfQfKQ==:17
 a=IkcTkHD0fZMA:10 a=iox4zFpeAAAA:8 a=hGzw-44bAAAA:8 a=yMhMjlubAAAA:8
 a=hNOTfydlAAAA:8 a=NA896NxhSAy2TpZPZw8A:9 a=QEXdDO2ut3YA:10
 a=WzC6qhA0u3u7Ye7llzcV:22 a=HvKuF1_PTVFglORKqfwH:22 a=fZunMKNLB757I4m4HZ3M:22
X-SECURESERVER-ACCT: tom@talpey.com
Subject: Re: [PATCH][SMB3.1.1] Add defines for new signing context
To: =?UTF-8?Q?Aur=c3=a9lien_Aptel?= <aaptel@suse.com>,
 Stefan Metzmacher <metze@samba.org>, Steve French <smfrench@gmail.com>,
 CIFS <linux-cifs@vger.kernel.org>
References: <CAH2r5mtwBHTk-Xoeuo+RbgNwiNw-cWTAhdy1YG5y+vXnNDSv4w@mail.gmail.com>
 <bd8f21ed-5fd4-0974-f15a-16d2f3ee607f@samba.org> <87r1q3hixr.fsf@suse.com>
Message-ID: <827fd43f-40a9-9480-a6b9-aea1fa69090c@talpey.com>
Date: Thu, 15 Oct 2020 14:15:32 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <87r1q3hixr.fsf@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfLmTpx9naniZReK859+SV7OpWXmKk90o0qW9Iu8lGA2lvvOTOIOQ+XwLwLRalM3IYh9oay3wogCYDv5OOZy7qcJSI7rd0lc//8EQNhRk5/gPvbJt6H7Y
 iz0P9B3TRA6Yu6gIG/x17OL/9X4WaRVbzV2iOBjOWX3nKu7S9Im0sMEsn07BguCFXjUtwRU/1U03J4aWFxozvYCm9OG7/uyq738uDthRjCXIPrqd8cLCoa8o
 kkusUjwzblO6ohdqFaOGc7ehIh30uFz/JZIbk0OB3NM+54siHMlRvoW/dbe4BkXn
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 10/12/2020 5:50 AM, Aurélien Aptel wrote:
> Patch LGTM
> 
> Reviewed-by: Aurelien Aptel <aaptel@suse.com>
> 
> Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
>> This isn't in MS-SMB2 yet.
>>
>> Is this AES_128?
> 
> This is returned in latest Windows Server Insider builds but it's not
> documented yet.
> 
> https://www.microsoft.com/en-us/software-download/windowsinsiderpreviewserver
> 
> I've asked dochelp about it during the SDC plugfest and they gave me
> this:
> 
>      The new ContextType is:
>      SMB2_SIGNING_CAPABILITIES 0x0008
>      The Data field contains a list of signing algorithms.
>      •    It adds a new negotiate context, which enables SMB to decouple signing algorithms from dialects. E.g. if both client and server supports it, a session may use HMAC-SHA256 with SMB 3.1.1.
>      •    It adds the AES-GMAC algorithm.
>       
>      SigningAlgorithmCount (2 bytes): Count of signing algorithms
>      SigningAlgorithms (variable): An array of SigningAlgorithmCount 16-bit integer IDs specifying the supported signing algorithms.
>       
>      The following IDs are assigned:
>      0 = HMAC-SHA256
>      1 = AES-CMAC
>      2 = AES-GMAC
> 
> 
> I've been CCed in a Microsoft email thread later on and it seems to be
> unclear why this was missed/wasn't documented. Maybe this is subject to
> change so take with a grain of salt.

Just curious if you've heard back on this. Insider builds will sometimes
support things that don't make it to the release. Even Preview docs can
change. However, AES_GMAC has been on the radar since 2015 (*) so
perhaps the time has come!

I'd suggest wrapping this context and the integrity algs in some kind of
conditional, in case this is delayed...

Tom.

(*) slide 29+ 
https://www.snia.org/sites/default/files/SDC15_presentations/smb/GregKramer_%20SMB_3-1-1_rev.pdf

