Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B97C32AF7
	for <lists+samba-technical@lfdr.de>; Tue, 04 Nov 2025 19:37:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=S+qOQwxfN64qmYsF01vjK7YlVT/sIFKRQ4EeU3BDs4o=; b=RjcBUA5eLU/jKpLMwRvLtDVyBy
	gsgkU450DB5B1FLN1ir5/+b4OA7EkXuA9PuYw4P7dAwJAwwlY6yD3cltDUdLkK1Ak4+h6ex+PCHta
	sqcMBaMDBhnPyw3ngz+0pFWIrXkUG8lOYQo5139RgHG+oQIwi301soVrVeDh3g5n3Tdnj3ORKSvxi
	1PtB1yIY/8JUWzTbxRwl7ospTMKWEzGJgNdgNTmyJYWDEbdyZ4+uzY09VEbbwUC7dFsw542m0xjR8
	CJ5kDz7KzjIfhYDnR8/QlteVigm7sCPpcPxoKvl84u3N66XBh1EmzsBE+isJWUXDSsHccbTecGVlW
	xm4x561w==;
Received: from ip6-localhost ([::1]:18874 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vGLtP-00BUki-0R; Tue, 04 Nov 2025 18:36:31 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:58421) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vGLtJ-00BUkb-Vx
 for samba-technical@lists.samba.org; Tue, 04 Nov 2025 18:36:29 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4775895d69cso4957445e9.0
 for <samba-technical@lists.samba.org>; Tue, 04 Nov 2025 10:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762281385; x=1762886185; darn=lists.samba.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S+qOQwxfN64qmYsF01vjK7YlVT/sIFKRQ4EeU3BDs4o=;
 b=FB8npLQgbUWIB9bYSVB5DamrUdA3Af1u/DVyqDeeEIY+cw3NTAM8hJDMu5NJhQXo5I
 ZkSZc195FPHILHHIlaaDJn5AABsJxw99QStquQ6dGToVpUf/thr7an3r0YtHEpHpjbLO
 bThC1TG3CoeYLaTJktUReRAfFcUe0fk4cLHGnFkWmkdiockJW9ceU7f48hDmBr/wtHyV
 34H//8NRyO95jwKVm02sMmA9/fYf+JB0tfhytwGy7cNxeKmI2t25UD8BqjIXLGTQAYJM
 Qm4OYAHWn9UPjhr/Js4EL+ynY9Ee1kkqjkKgmfHpU7NTR/0n0PrxpJawVYoKP1HB5erS
 my/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762281385; x=1762886185;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S+qOQwxfN64qmYsF01vjK7YlVT/sIFKRQ4EeU3BDs4o=;
 b=FhIXk510CyUpW+wEbwiptfQGYetnyGg6PkBLp2bnneHcG4hUzHJzxgPvnf+qxQUoC8
 fzsCnzt6PvJGR0GZXCQyCSPkhHDwfplmGmteNVH6Na9AKGcCBizXSaIjcQIOi+fhwml7
 lrNdhIQzawN1dfoLnrONZW/LH9txplZfiiEalvrIuyGTfhxCSPg9jLoKOKnJKEUCp2ty
 r6zlZQQjFni5cSmR6qsK/o9aUKoia1apmOpW3972ZmePZzbkYnMhb5Jbk6b5a7soL79P
 /sXUCQRHN4DJMPkPQjNfZJfHB3to/X/fGj3OAmuEdIvSQkzwJ3brPH4vm4isZ74wY/uV
 QNdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDP+aWBxzIuQBd/RqVt4Gvtix2ioo3MelcN/CHvsCl3WENXCiSNYzRiiq/YdvM500vllnWn89iej+BS9KxDk0=@lists.samba.org
X-Gm-Message-State: AOJu0YzigVjwE6sq/ih22Tc8YcGoR641EQU7U9I5zNEuL5EwEoj5roax
 /WcY4Uf6Fu4ZlhXwk7KJhlzq9cNepG0NOYphKPzSRz4TwKqnAFT5kWxaNmCJkTBQCos=
X-Gm-Gg: ASbGnctTXfdZnXqu160YR55aAZVfwWp51a9QK3pGwQYNCHQ1TVRDPbfpA7Bm0IHO0mb
 0mOhMxPOIuilu5DSqgJ4yYNabAY39OF3hxzRFY7lUyTPc7Pt1vkDKzuIwlQW+O9ZCCZExzIHedx
 HJP5iHF3n8kAbWc6IfAxtm5iqbjhDV+iS/jYha9o2ZjTFKwqt6jBuhOPZapO2hBXmszdwQvWxdH
 wkKnbR4x2qFhHNNpq0/PNHvrJ+IVy9mbiUVERlmldfuh8v6WDFhFdsdHCmk6/oBQ6gHWSKXMGjy
 CO5RoeFl2cwdxuq2xagRymPf8ZAk4u1b2QKoVwbWY95BmV3tSgvEjlPprKxFN+uEW3roGLfEhX2
 ZswNR2LW6XbI1hhdbrP97GauVBmoqkGrpObRQpOIANGFYi4kwSOKD+Fe14KoPsBIuP9gRencxYA
 LOeN1s/SGXnC8MZ2anH3Wcpmc=
X-Google-Smtp-Source: AGHT+IEnR2psnzPx+1g8M1v8iuPpltBNgHmLBznqDt6V+MFNoJ7oCyKOUDMVl+6Ny1hv8tF/qNLwHw==
X-Received: by 2002:a05:600c:1d07:b0:471:803:6a26 with SMTP id
 5b1f17b1804b1-4775ce265d1mr2708915e9.37.1762281384874; 
 Tue, 04 Nov 2025 10:36:24 -0800 (PST)
Received: from [192.168.15.14] ([152.234.106.4])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7acd392040csm3651030b3a.19.2025.11.04.10.36.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Nov 2025 10:36:24 -0800 (PST)
Message-ID: <33de0eaf-474b-4e88-a445-2f12387bc36c@suse.com>
Date: Tue, 4 Nov 2025 15:34:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] smb: client: fix refcount leak in smb2_set_path_attr
To: Shuhao Fu <sfual@cse.ust.hk>
References: <aQoYCxKqMHwH4sOK@osx.local>
 <CAH2r5mu7s4p88RhUbCm5mqUvEVM60OOTTJOZ+rz09nFfc+t3mQ@mail.gmail.com>
 <648b7b14-d285-449a-a1b3-4cd062a55b02@suse.com> <aQowQ7gCdDruGVro@chcpu18>
Content-Language: en-US
In-Reply-To: <aQowQ7gCdDruGVro@chcpu18>
Content-Type: text/plain; charset=UTF-8
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
From: Henrique Carvalho via samba-technical <samba-technical@lists.samba.org>
Reply-To: Henrique Carvalho <henrique.carvalho@suse.com>
Cc: linux-cifs@vger.kernel.org, Shyam Prasad N <sprasad@microsoft.com>,
 Paulo Alcantara <pc@manguebit.org>, Steve French <sfrench@samba.org>,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Tom Talpey <tom@talpey.com>, Steve French <smfrench@gmail.com>,
 Bharath SM <bharathsm@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 11/4/25 1:56 PM, Shuhao Fu wrote:
> On Tue, Nov 04, 2025 at 01:23:33PM -0300, Henrique Carvalho wrote:
>>
>>
>> On 11/4/25 1:12 PM, Steve French via samba-technical wrote:
>>> There are multiple callers - are there callers that don't call
>>> "set_writeable_path()" ?    And so could cause the reverse refcount
>>> issue?
>>
>> Yes... Even if it does not cause an issue today, that fix looks like it
>> belongs inside smb2_rename_path?
> 
> I placed decrement in `smb2_set_path_attr` since it seems like a wrapper
> of `smb2_compound_op`. I figured that this wrapper should handle the
> failure cases the same way as `smb2_compound_op`.

Makes sense.

Acked-by: Henrique Carvalho <henrique.carvalho@suse.com>

> 
> Thanks,
> Shuhao
>>
>>>
>>> On Tue, Nov 4, 2025 at 9:21 AM Shuhao Fu <sfual@cse.ust.hk> wrote:
>>>>
>>>> Fix refcount leak in `smb2_set_path_attr` when path conversion fails.
>>>>
>>>> Function `cifs_get_writable_path` returns `cfile` with its reference
>>>> counter `cfile->count` increased on success. Function `smb2_compound_op`
>>>> would decrease the reference counter for `cfile`, as stated in its
>>>> comment. By calling `smb2_rename_path`, the reference counter of `cfile`
>>>> would leak if `cifs_convert_path_to_utf16` fails in `smb2_set_path_attr`.
>>>>
>>>> Fixes: 8de9e86c67ba ("cifs: create a helper to find a writeable handle by path name")
>>>> Signed-off-by: Shuhao Fu <sfual@cse.ust.hk>
>>>> ---
>>>>  fs/smb/client/smb2inode.c | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/fs/smb/client/smb2inode.c b/fs/smb/client/smb2inode.c
>>>> index 09e3fc81d..69cb81fa0 100644
>>>> --- a/fs/smb/client/smb2inode.c
>>>> +++ b/fs/smb/client/smb2inode.c
>>>> @@ -1294,6 +1294,8 @@ static int smb2_set_path_attr(const unsigned int xid, struct cifs_tcon *tcon,
>>>>         smb2_to_name = cifs_convert_path_to_utf16(to_name, cifs_sb);
>>>>         if (smb2_to_name == NULL) {
>>>>                 rc = -ENOMEM;
>>>> +               if (cfile)
>>>> +                       cifsFileInfo_put(cfile);
>>>>                 goto smb2_rename_path;
>>>>         }
>>>>         in_iov.iov_base = smb2_to_name;
>>>> --
>>>> 2.39.5 (Apple Git-154)
>>>>
>>>>
>>>
>>>
>>
>> -- 
>> Henrique
>> SUSE Labs

-- 
Henrique
SUSE Labs

