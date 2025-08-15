Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB41B284DF
	for <lists+samba-technical@lfdr.de>; Fri, 15 Aug 2025 19:24:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ta66Vn8mVOjenvpAsIEUWNbKg+7xIcsPsoup4eTnyvs=; b=sYgA36IZZxAmHk2V1RJLSo75f6
	PSSdwDRKtLMw9CfUueVQg+mcfwXUAFz3QeM7+JQSyBiXN3ShburNj3Nq/m88jRzSI7hBVGPV4E48S
	hKxHH4zDntgHPFxO4yVWoeyWc1pr4l1cHsle6Av9BdYfMZHo67E45AN0NI3fbwiPfenmcVF5otBAQ
	VU8753VsR6I6B4Kr+uaAKK9jRmmwn1yiBOyatci1wgYV330xS3gxERDW8YADiu8BZM8/WGPLO+Lpp
	QxxYVGAeCj1Brf3KQ0B5D6Gnr+GlYBdoZ21ipffAtsd9GADuTwCpGK+xqOk/Qqhc7IAr4e5tndi6q
	gdhpWGrw==;
Received: from ip6-localhost ([::1]:30174 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1umyA1-00F5jT-7E; Fri, 15 Aug 2025 17:24:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32332) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1umy9x-00F5jM-Gr
 for samba-technical@lists.samba.org; Fri, 15 Aug 2025 17:24:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=ta66Vn8mVOjenvpAsIEUWNbKg+7xIcsPsoup4eTnyvs=; b=3YjT9csW5QBrWjQm510VR4onN9
 rSWS6JfDOyikb1NgoH6fCaKy2mYf2tOBwikRpEp4ueDW+IlaSzoBa2BcTvS17gMsHv7u8s8qj8tao
 QproOv2EfHmqSRyXAp/E2Lir6A+YrIardmLMHF9a1TxgpCxhfxtnxs+TU0KS7PIcM9GlUoyjXIzWw
 ma8nY0hXXYTPFqdNpKdQXjT2hqO3NsNkFSdoljuPZ5fYhssHs9Spe7MK4NNOec5ychxL85ZycqGUE
 X9i1RQHlvqVTqBdGakROpI7D6F9i7ZAc84JT1PbHwIhMP3EHglCk3rvd2XXVfTXfJriUSZ9UTcVPO
 JTkuIFeihX/MxJ9bfEnSBqXCY571vi9gnWXEZ07fuEJCUqdcKXXD7Ep7HhtoUNYxlNmImJo98uo2v
 2n2DQWkw8P6lxSUcH3JDzIl94lyJ5UhLom3aCVz61tExDhoC0iZ956jtErXZPeR+ZIMob6i0KyJOI
 GsKTTyckVRXWrqsHrtK6ltCX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1umy9w-0032Ev-1m; Fri, 15 Aug 2025 17:24:08 +0000
Message-ID: <0bcae9fe-1dff-4530-875b-fe917af5b649@samba.org>
Date: Fri, 15 Aug 2025 19:24:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] smb: server: split ksmbd_rdma_stop_listening() out of
 ksmbd_rdma_destroy()
To: Steve French <smfrench@gmail.com>
References: <20250812164546.29238-1-metze@samba.org>
 <cwxjlestdk3u5u6cqrr7cpblkfrwwx3obibhuk2wnu4ttneofm@y3fg6wpvooev>
 <706b8f8e-57f2-4d34-a6f8-c672c921e4f2@samba.org>
 <CAH2r5mvtxMnwdgz15RrSZj_Kut9WVLGK+WRGUGQD1Rs_MJEWbA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAH2r5mvtxMnwdgz15RrSZj_Kut9WVLGK+WRGUGQD1Rs_MJEWbA@mail.gmail.com>
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
Cc: Tom Talpey <tom@talpey.com>, Pedro Falcato <pfalcato@suse.de>,
 samba-technical@lists.samba.org, Namjae Jeon <linkinjeon@kernel.org>,
 linux-cifs@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 15.08.25 um 18:52 schrieb Steve French:
>> Steve can you remove 'return' so that the line is this:
>> static inline void ksmbd_rdma_stop_listening(void) {
> 
> Done, and have updated ksmbd-for-next
> 
> Updated patch also attached, let me know if any problems.

Maybe also remove the 'return;' from the inline ksmbd_rdma_destroy function?

> Also let me know if you have rebased versions of the other smbdirect
> patches for 6.18-rc so I can get them in linux-next

I guess I'll base on Monday on 6.17-rc2 and will post what I have then.

Thanks!
metze


