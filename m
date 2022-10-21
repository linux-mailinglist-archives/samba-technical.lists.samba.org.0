Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA3E607A67
	for <lists+samba-technical@lfdr.de>; Fri, 21 Oct 2022 17:23:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=6sHz64VynwCgbnLcwyqeo9ViskSMz/sidagCYcS1UQo=; b=qeBpokyLLDNdjp+qEKD8t/3llC
	k08FNY/2czn01ji5qrU2EPsYJInq3tRmBG2gJxP+P7YJutV7jCo/G+yqP0SLSbDjRLOKHFSJ6Fv68
	rXSZyvbuTsF88wXOqmO+6MAATuARp3IV1Vk1OSTxfjmFxgyJxpopzexEMw9qXMSOkyek5Qj49sR3d
	Xbi+J/NJAKSuYF31olXRbwjqXYumea1GjQyagIZF2XNHcj2qFf6BPjd69NPqS41oi8U5VxOJHE2JL
	UyYXCYFI6ajlorRJhBfPB1KyrWFrSA0Y7aOWepQz9wkARxqao3eB26XzDa1JPaCIGd3hE3Z08DIdp
	XNIJEJoA==;
Received: from ip6-localhost ([::1]:46586 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oltrf-004Saq-3b; Fri, 21 Oct 2022 15:23:15 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:37511) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oltrY-004Sah-D5
 for samba-technical@lists.samba.org; Fri, 21 Oct 2022 15:23:11 +0000
Received: by mail-ed1-x52d.google.com with SMTP id m16so7138641edc.4
 for <samba-technical@lists.samba.org>; Fri, 21 Oct 2022 08:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=puzzle-itc.de; s=google;
 h=content-transfer-encoding:content-language:in-reply-to:organization
 :from:cc:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=6sHz64VynwCgbnLcwyqeo9ViskSMz/sidagCYcS1UQo=;
 b=GLkWDntE0HUPGOLtQOMmYvyi5Sewj657QDoqTZ+xnO4ykT8w9lLLAHX8qo6sB5QSaU
 K8QS7T+rK4Xh2wdyBstEhlzePoSFTVJPpmuBdFJWWKx28pZUEWictpYX6WcOOOFM1ijf
 9tqxJa7Kv9IRVrH/mtxF66iKV5njevSKrvXTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:content-language:in-reply-to:organization
 :from:cc:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6sHz64VynwCgbnLcwyqeo9ViskSMz/sidagCYcS1UQo=;
 b=RUdwKLsATX+KQvWVgrf/rVEejejpuRkDiHLZGcl0iHW4+BEASqLBghG9XVGXQ6eJfh
 QruwpHoAHNYfZVlzVBNKietqr2ERMoyYMOCh4HXNn58E3C9lttRx8nml/GsXN6IX5d3y
 Me/S6ainaOXue99wzLTtUg0T36DMMjrLqGgPrMwCvylF8LE/bj5v1jaGssV9Q3ACv9QH
 BQ93m+OympFvK+llMzPYKJwhmGhAGYR8hGyQ+nxSf/QOWmVh61+gm36/CoFUC2NOGtOu
 YyovSHBXXLym/gWvktHMBHfUrXQbBWbFhRuzde6+3Ovn/7NkOzV3SPyEd/sLH8dBNrkD
 DNiA==
X-Gm-Message-State: ACrzQf3wqY8AQ1LiCb+ZO9I4zqF5uYYp8/GfsrL/vByHLAAWgFNGqzeF
 s1Mn7F7Nef5gBFokX2fYD6U5ys3sx5Gf0XbMp1y7WsGsRsqCGIcp9HJtSAXyjiNh4Cy9cIG5Eys
 tUs1Jl8xX+Gbyj3DnPeRZBsU/N3g9gA==
X-Google-Smtp-Source: AMsMyM7Ay4ZcfU3BkkjIK/nDb1UynbAAzAMCvwjdv9QIh7TFQdGbxc/7hfoxH/tj3+CX4aIN+ByvuA==
X-Received: by 2002:a17:907:c03:b0:781:fd5a:c093 with SMTP id
 ga3-20020a1709070c0300b00781fd5ac093mr16058317ejc.89.1666365787469; 
 Fri, 21 Oct 2022 08:23:07 -0700 (PDT)
Received: from ?IPV6:2a02:8070:8884:cd80:7827:2681:280a:9848?
 ([2a02:8070:8884:cd80:7827:2681:280a:9848])
 by smtp.gmail.com with ESMTPSA id
 k26-20020a17090632da00b0078082f95e5csm11697970ejk.204.2022.10.21.08.23.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 08:23:06 -0700 (PDT)
Message-ID: <5b08d4aa-2d59-b5d6-07ad-9cc40438aeb1@puzzle-itc.de>
Date: Fri, 21 Oct 2022 17:23:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH RFC] s3: smbd: Consistently map EAs to user namespace
To: Jeremy Allison <jra@samba.org>
References: <d9c11a44-538d-963e-46b5-37fa24bf5bb9@puzzle-itc.de>
 <ecd8ac98-c8d7-43b6-b0c0-d6deb7352ad7@samba.org>
 <Yzsp/U5itUs486Ic@jeremy-acer> <YzsqwptGoGijMcib@jeremy-acer>
Organization: Puzzle ITC Deutschland GmbH
In-Reply-To: <YzsqwptGoGijMcib@jeremy-acer>
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
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
From: Daniel Kobras via samba-technical <samba-technical@lists.samba.org>
Reply-To: Daniel Kobras <kobras@puzzle-itc.de>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi all!

Am 03.10.22 um 20:32 schrieb Jeremy Allison:
> On Mon, Oct 03, 2022 at 11:29:17AM -0700, Jeremy Allison via=20
> samba-technical wrote:
>> On Thu, Sep 29, 2022 at 02:17:57PM +0200, Ralph Boehme wrote:
>>> On 9/27/22 13:10, Daniel Kobras via samba-technical wrote:
>>>> The issues can be avoided with a consistent mapping between Windows EA=
s
>>>> and the 'user' namespace in both directions, ie. no longer present EAs
>>>> outside of 'user' as Windows EAs in SMB_INFO_QUERY_ALL_EAS and friends=
.
>>>> Do you agree with this approach? Are there applications that rely on
>>>> the current mapping of non-user EAs? Please let me know if I should
>>>> submit the patch as a proper MR.
>>> before jumping to action can we also please briefly consider the=20
>>> Linux kernel mount case with SMB3 Unix Extensions and mount over SMB?
>>>
>>> The proposed approach makes sense for Windows clients, maybe be=20
>>> should incorporate exposing the raw namespace when UNIX extensions=20
>>> are negotiated. In the end this is likely going to be a made via a=20
>>> later MR in the future, but I'd like to see both cases considered now=
=20
>>> that we're making changes.
>>
>> The SMB3 Unix Extensions can be fixed later via a new MR.
>>
>> The behavior for SMB3 Unix Extensions should be that GetEA/SetEA
>> calls on a SMB3 Unix Extensions file handle should not hide the
>> namespace from the client. From my experiments as root on Linux,
>> the ListEA call only ever returns names from the user. namespace
>=20
> Ah, that's not the case :-). I now checked with strace getfattr,
> not just looking at it's output, and the listxattr() call on
> Linux does return non user. namespace names, it's just the
> getfattr tool that doesn't print them.
>=20
> Still, that doesn't change the underlying fix for now.

Ok, I've just submitted the fix in=20
<https://gitlab.com/samba-team/samba/-/merge_requests/2763>.

Kind regards,

Daniel
--=20
Daniel Kobras
Principal Architect
Puzzle ITC Deutschland
+49 7071 14316 0
www.puzzle-itc.de


--=20
Puzzle ITC Deutschland GmbH
Sitz der Gesellschaft: Eisenbahnstra=C3=9Fe 1, 72072=20
T=C3=BCbingen

Eingetragen am Amtsgericht Stuttgart HRB 765802
Gesch=C3=A4ftsf=C3=BChrer:=20
Lukas Kallies, Daniel Kobras, Mark Pr=C3=B6hl


