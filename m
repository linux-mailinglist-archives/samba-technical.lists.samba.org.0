Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A984461E885
	for <lists+samba-technical@lfdr.de>; Mon,  7 Nov 2022 03:05:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Ygz3wEaFSEVURM0C2O63fCt+9TnpjCm5HeI6ji9n8xM=; b=k5mDjxxnmDDvOdYfodbVeGZcNR
	hJWZVibRSMQpYav0v3pSTnfgoaqigEAAlYcnWat4Hgy0Uopvn4sBtuXnKtXdiluhlmX3NagA7J6n2
	yDuXQRkhjM/e3toIyigWHazU+o8X/ZiSxqglPwcWgmTa9RN/S1+Jrzgf/jtNjgkBDW3Bsk2aOyG9C
	RuByrgwSQ0W2UNdoXvTg0xmyMRVatoqJgmQwLMJoKeNsGCl6Qe4n8HLSrHH4ysnt6Kqle0MtYbsbx
	fMJ+izkZdIy4rSUUsw5fQTSyJVd9RUca4gbVgd4zMzOVGhEGsbTXB3Wead8MP8YeT9RAJH5BO2+pa
	2w3n/3AQ==;
Received: from ip6-localhost ([::1]:49676 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1orrVS-00BDIL-U6; Mon, 07 Nov 2022 02:04:58 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:40932) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1orrVL-00BDIC-UQ
 for samba-technical@lists.samba.org; Mon, 07 Nov 2022 02:04:56 +0000
Received: by mail-pg1-x52b.google.com with SMTP id g129so9194634pgc.7
 for <samba-technical@lists.samba.org>; Sun, 06 Nov 2022 18:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mattgrant-net-nz.20210112.gappssmtp.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tFRls9AR3GPpmk8Ed5BxRlu4C9InR2Ral1sGbd/4Tws=;
 b=2jfN+WwgFdUnm+dLfoMHkfd3fef+aRELyUnu82Ww96we0Fhe8h51tJq8HmVggxodxY
 En1y5zWcpR3AUL0wBIw/41W8gxSR4G+SW8ZVDxNC7Kt3vNp4ky+pS0hFkH7QWsa+ogbi
 x0RwQCXOWhymTEqspkUQNNGa/uHtni8X9AzQRdEtF/kkgXkVMUzkLQk0nvho4ofHsvDy
 8QGXShi+z4FWfTes2EL+UADorh53Qr+lFVUBHv6DUehG0nF6269oFHRHbeQD660l9uXQ
 5kp1pjkGZjKjV86dm9+LtiS7JSyMq9AbFjILLedHhdmWNRkjkrMmn1dpWTS7c0kSS1Sr
 ZO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tFRls9AR3GPpmk8Ed5BxRlu4C9InR2Ral1sGbd/4Tws=;
 b=Hv+/mxJ5Vn2ug80jwd586hRMmo439/646tDqA0mimTXkY6B2BIq3mAVrORExHBEYfN
 f46shd6mWEM8zRbi2/OfSJHRRb3Oku/ua+Wb/ZRcVtgva2+wufqa+8quqXKpbh1JxDP9
 irgCn2LhE3EOMS0+jTGZUTRfi4nuvZYBedd6nS+xXJ2FdDh14FyiNQ5rrL9KjBZDvTOz
 bwXvrmsySZiG3TzzSANYzJ8EWz+yt+4fV0uhM7n1AWGYw2JVNm+SULyjd96L4Q8FucBK
 2fPmajvIIFF8eay691193wJYXQ1S2EPh38E7PFOe6U26t6JAtHHa63mFoWENxVsfed/E
 Ugag==
X-Gm-Message-State: ACrzQf1vb0AIyqdlKC4fmmPCDEeDzj5RU6XdX2gXFP8zQirODTtS69xk
 wApB9mFievvh4+qGmCl9Vlh/RqE5pdxpw2bRKJsk9TNyQAnCkQ==
X-Google-Smtp-Source: AMsMyM6F/G7x2aveGjMRvJBXxNSmO2HwJCTPVppdi3vaLhKV6itkJZNvwNm1m/WW9NfZOHiNEQUFGMt3CkU8vo0CNGI=
X-Received: by 2002:a63:1308:0:b0:440:5517:c99d with SMTP id
 i8-20020a631308000000b004405517c99dmr26427458pgl.550.1667786688085; Sun, 06
 Nov 2022 18:04:48 -0800 (PST)
MIME-Version: 1.0
References: <CAHA-KoNnFFXfyB=vR-2F6oooTnGcPVHafQOVKQDpQjaDJa-0-g@mail.gmail.com>
In-Reply-To: <CAHA-KoNnFFXfyB=vR-2F6oooTnGcPVHafQOVKQDpQjaDJa-0-g@mail.gmail.com>
Date: Mon, 7 Nov 2022 15:04:38 +1300
Message-ID: <CAHA-KoPuf=VhT4N_km-G8cnEzYDOVv42C7Yi8BOTw+heRHLJRg@mail.gmail.com>
Subject: Re: samba-tool gpo listall failing - what's going on please
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Matt Grant via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matt Grant <matt@mattgrant.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!

More information.  finddcs() fails if there is only an AAAA for the DC, and
no A record!

Pretty messy in there.  Should I be looking
in source4/libcli/resolve/dns_ex.c, get_a_aaaa_records()?  That multi
threaded stuff does not look very readable or debuggable...

Debug level 12 is not giving me any useful traces.

Cheers,

Matt Grant

On Mon, 7 Nov 2022 at 13:48, Matt Grant <matt@mattgrant.net.nz> wrote:

> Hi!
>
> Got samba-tool gpo listall failing as well as the other samba-tool gpo
> commands with the same error.  Command output follows.  This is on Samba
> 4.16.5.
>
> Need to get it going to initialise and administer GPOs properly.
>
> Thank you!
>
> Matt Grant
> --
> smb-ad1: -admin- [~]
> $ sudo samba-tool gpo listall -d3
> lpcfg_load: refreshing parameters from /etc/samba/smb.conf
> ldb_wrap open of secrets.ldb
> GENSEC backend 'gssapi_spnego' registered
> GENSEC backend 'gssapi_krb5' registered
> GENSEC backend 'gssapi_krb5_sasl' registered
> GENSEC backend 'spnego' registered
> GENSEC backend 'schannel' registered
> GENSEC backend 'ncalrpc_as_system' registered
> GENSEC backend 'sasl-EXTERNAL' registered
> GENSEC backend 'ntlmssp' registered
> GENSEC backend 'ntlmssp_resume_ccache' registered
> GENSEC backend 'http_basic' registered
> GENSEC backend 'http_ntlm' registered
> GENSEC backend 'http_negotiate' registered
> GENSEC backend 'krb5' registered
> GENSEC backend 'fake_gssapi_krb5' registered
> interpret_interface: Adding interface fd14:828:ba69:12::2/64
> interpret_interface: Adding interface fd14:828:ba69:12::2/64
> interpret_interface: Adding interface fd14:828:ba69:12::2/64
> interpret_interface: Adding interface fd14:828:ba69:12::2/64
> resolve_lmhosts: Attempting lmhosts lookup for name _ldap._
> tcp.SMB.ANATHOTH.NET<0x0>
> dns child failed to find name '_ldap._tcp.SMB.ANATHOTH.NET' of type SRV
> finddcs: Failed to find SRV record for _ldap._tcp.SMB.ANATHOTH.NET
> ERROR(runtime): uncaught exception - ('Could not find a DC for domain',
> NTSTATUSError(3221225524, 'The object name is not found.'))
>   File "/usr/lib/python3/dist-packages/samba/netcmd/__init__.py", line
> 186, in _run
>     return self.run(*args, **kwargs)
>   File "/usr/lib/python3/dist-packages/samba/netcmd/gpo.py", line 469, in
> run
>     self.url = dc_url(self.lp, self.creds, H)
>   File "/usr/lib/python3/dist-packages/samba/netcmd/gpo.py", line 127, in
> dc_url
>     raise RuntimeError("Could not find a DC for domain", e)
>
> smb-ad1: -admin- [~]
> $ view +127 /usr/lib/python3/dist-packages/samba/netcmd/gpo.py
>
> smb-ad1: -admin- [~]
> $ host -t SRV _ldap._tcp.SMB.ANATHOTH.NET
> _ldap._tcp.SMB.ANATHOTH.NET has SRV record 0 100 389
> smb-ad1.smb.anathoth.net.
>
> smb-ad1: -admin- [~]
> $ host smb-ad1.smb.anathoth.net.
> smb-ad1.smb.anathoth.net has IPv6 address fd14:828:ba69:12::2
>
> smb-ad1: -admin- [~]
> $
>
>
