Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC86B9D760
	for <lists+samba-technical@lfdr.de>; Thu, 25 Sep 2025 07:34:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=+tRVFXCTqAGQEpGnYIdRKT4Vs6hi5CJjQ5R5WdpycMw=; b=cQqgO48zWNfuYMtrkAHey1J0iP
	IcelHTsJY9HEYH9U/9O3vzl87bvVPHQ0sZD4ykg/Stbe9Jv5x51S0orlRaxPqi3DIpbFKg2dRetS9
	glY6VcGoxcPQwNKlsxJbf3maI5no9YyA60wPqsHMvpQo8oUWVJRr+ccpI9JHa6JRh8WrKgnfwLs4A
	LySM8TClwS52FeyoQC0YTqz3Xa9EwrH4mmX5Q8HLl17mnCkbU/rfcw1cwlep5pTxq8ynmZ+gSXdRI
	tChpGDuBypgw3L6kFv158EzpNs8YaktmnwMBLUeK9lhKEsKx3pD1Px08DBn8ala7nTbcRQP/9dBYW
	/Dn96Cog==;
Received: from ip6-localhost ([::1]:39918 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v1ecO-004iUj-6Z; Thu, 25 Sep 2025 05:34:12 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:41066) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v1ecJ-004iUb-40
 for samba-technical@lists.samba.org; Thu, 25 Sep 2025 05:34:09 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-7f0e9aec247so857926d6.0
 for <samba-technical@lists.samba.org>; Wed, 24 Sep 2025 22:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758778445; x=1759383245; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ujTzgaGShe9d/DPw1Vl9CahY96BX3vWN54UbsueZsro=;
 b=Sazu9cLXTLM2yNn0MiJi8juOK2DRmtxWSCNJyObCQyK/ixFe7GA7IHgsioNk4IHFYA
 9BvLufaMHZkmKPQsS3L0fBUiETIJGk7MnK6KWbZskIZhpyDFTssEDiEUCzpDW5NRqM7i
 2u/k6tB5Xvi4h0l0heahSK0k8SBKkFpcNhQb828ncdAz8bAGDnWVxgNFM7pPtOuUNXvI
 xlO0DaqMXwlcYxWGiWFUV0+f59UjU2Cjb6fB+R2DMaP8KjyQfewuQlalrlZ3t3YIxOYu
 TNjXbpyyG6mWu+46EsOf7LyyUqc2E8fvAhWicXC0dbSq667hftTP4GN+H4ksGa3d+MZA
 0RYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758778445; x=1759383245;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ujTzgaGShe9d/DPw1Vl9CahY96BX3vWN54UbsueZsro=;
 b=cAJ2kkP9HBTy9G6lAn9DqJ4gT53Nj24UnTvHlRL8/vuBPhZmu6323lpzQmjT8/O443
 UbO4h6yQqOVnuiDu63lydDrCtHs5XBUMcJ87GTp5HuTDqCxkBBvurqLo9pNtKraBZxjm
 2mYEveOnWnu85JfRD6J9jl8Q5l5ktb3H0j/kxSCegLpSGWISmAKY7/s/C6qZQ+ZXOeZh
 vQT7bC1SKzPUPA39qec7D6aF19br/sUqdtFnecQjzMvPeyM33rlgwY9rtnDtW1nXlzk4
 +L3ZJgWauK4QwmROqkuhiU7S/Y6c/BM+QoRowH2NIhcSCXr0B9J2/MZ1fMwvCG8GbYdF
 fhKw==
X-Gm-Message-State: AOJu0YybTzKhYPRuK/GudF3Fuh27Uzv5Kkx9cmqNghGAhcbIs/sZz/3p
 9PG0yu4IOyzUU1fLWFO2UMdCftlegqjvCRkQPI2MuuF7iARWZok2BZRR8SvLxCCn5tXkwUtnFH9
 kduShB7Qy6vhKYr+4bGwggEqx/T28aSYXsIvz
X-Gm-Gg: ASbGncuAqr3IjZEeecywz+nMMuLAHCyahhwhZx8F+zizO/Dhr3vCIby+fzfvxtrJDiZ
 BA6SQn6zJQqaqLTRXxKteAK+x1rvgwZt0mEMiCtqHavvb44ALrznoyjicGY+Od+SDUXRUDLzNCY
 CqDecqCIIXCTfZZVP0FmEhRr0FQM9dND49k6OFZjtyiQUGsv+4dqKgUsfWyoII715ghh3FMzGCN
 Gr32Fg=
X-Google-Smtp-Source: AGHT+IEvTPgdtN9JR5yq2sIKzJs8QMef/PtDBtq1jL4hcps/FGj8D3HJGMTIPklSQxqSRX0U5ezYqQ4vJuysqZEb1Og=
X-Received: by 2002:a05:6214:2502:b0:7a0:a767:a178 with SMTP id
 6a1803df08f44-7fc0eab2cb9mr21805436d6.0.1758778445022; Wed, 24 Sep 2025
 22:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <CADrT-m+CZf3_pzAkKXB0UVHkd1o6NJR2bN+udTf-PCEdvSS-eQ@mail.gmail.com>
 <db1fb336-7c9b-4816-acd8-e0815a460b80@tls.msk.ru>
 <1afde102d461529cb041d96e448b9d2d3f6fe836.camel@samba.org>
 <CADrT-m+wq8m42JjDt-eAZrMFqynz5yXKHk9q5ksUxiHew75Dpg@mail.gmail.com>
 <345d53679a0d41e1c930f37422eca0959eebbee7.camel@samba.org>
 <CADrT-mJXJq7YqntxGkzyTeFKK_Oc4fXoJGHJ_yLX-69aBFxhng@mail.gmail.com>
In-Reply-To: <CADrT-mJXJq7YqntxGkzyTeFKK_Oc4fXoJGHJ_yLX-69aBFxhng@mail.gmail.com>
Date: Thu, 25 Sep 2025 11:03:53 +0530
X-Gm-Features: AS18NWCb13yYyjjLfp1JUxtKmoXOEarp-HbOOqqH9HRwsH86mymuwhfyltZUk7Y
Message-ID: <CADrT-mK8+n51wGvHvaSTDG2UAR870c77wdJfVuoZ2MNG8GVC5w@mail.gmail.com>
Subject: Re: Proposal to change smbpasswd file format to address Y2K38
 coverity issue.
To: Andrew Bartlett <abartlet@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Vinit Agnihotri via samba-technical <samba-technical@lists.samba.org>
Reply-To: Vinit Agnihotri <vinit.agnihotri@gmail.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

I have done some poc for change, and I realise that we can't really just
change record to new record on password change event.
On event of password change, a record
"xyz:0:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:8846F7EAEE8FB117AD06BDD830B7586C:[U=
]:LCT-ABCDABCD"
Current code positions file pointer just after uid and overwrites.

Thus if we write using a new format, then it would overwrite the next
record.
Therefore we must convert all records one by one as soon as a file is
opened for any operation.

--Vinit.

On Mon, Sep 22, 2025 at 5:31=E2=80=AFPM Vinit Agnihotri <vinit.agnihotri@gm=
ail.com>
wrote:

> True,
> tdb_sam is next in line :)
>
> --vinit.
>
> On Mon, Sep 22, 2025 at 2:04=E2=80=AFPM Andrew Bartlett <abartlet@samba.o=
rg>
> wrote:
>
>> On Mon, 2025-09-22 at 10:55 +0530, Vinit Agnihotri via samba-technical
>> wrote:
>>
>> Thank you Andrew and Michael for your valuable feedback/suggestion.
>>
>>
>> @Andrew:
>>
>> Although this is true, I believe if we are to change this, then we bette=
r
>>
>> switch to 64-bit time_t, else someone has to revisit this after 80 years=
 ;)
>>
>>
>> The smbpasswd file has many other limitations, 80 years should be well
>> past its death.
>>
>> However, I note with more worry this in pdb_tdb, for the default tdbsam:
>>
>> /* times are stored as 32bit integer
>> take care on system with 64bit wide time_t
>> --SSS */
>> uint32_t logon_time,
>> logoff_time,
>> kickoff_time,
>> bad_password_time,
>> pass_last_set_time,
>> pass_can_change_time,
>> pass_must_change_time;
>>
>> In short, I think we should do the very minimal change for smbpasswd, bu=
t
>> tdb_sam should probably get a better fix.  I'm still not worried about t=
he
>> code running in 80 years, NTLM will be more than totally deprecated by t=
hen
>> I hope, but there is much more of a case to fix the default backend
>> properly.
>>
>> Andrew Bartlett
>>
>> --
>>
>> Andrew Bartlett (he/him)        https://samba.org/~abartlet/
>> Samba Team Member (since 2001)  https://samba.org
>>
>>
>
> --
> One Ring to rule them all, One Ring to find them,
> One Ring to bring them all and in the darkness bind them
> In the Land of Mordor where the Shadows lie.
>


--=20
One Ring to rule them all, One Ring to find them,
One Ring to bring them all and in the darkness bind them
In the Land of Mordor where the Shadows lie.
