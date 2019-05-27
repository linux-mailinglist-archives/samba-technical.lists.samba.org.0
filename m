Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9949F2AF0E
	for <lists+samba-technical@lfdr.de>; Mon, 27 May 2019 08:59:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=QRymIhKNXcgdzkepzkmFAMSEKp/p0yyxh5N3hf4yLWo=; b=hGYH9fFQRhVJ6KKGyhoKQlfKLe
	iuruD0ivl1+GX6ehN6QEvR26ggETDZMxSRgXHECU7vRnivFnkLzNl9s/Tr87LlhyZLjmiPU6EyM8B
	IoTL+HgTQdDHIXrJ5b4nHQfPaulhzl+8QC861R4vUKsyIhAF5Ko5/fo/A9a2BNNIlaCXvVgAPmse2
	stZFfVv8FMaKdlb+aC3dnAkO0ITF5MOjlGbiNY1xe425tYVX5OhwyFZ4Mw+3P8b6SUaEtWnRfhvrC
	YUfCB/pcFh+aDd3AnmmQMaISj8CgUsr8Ue+hfys/g8TFFB72BoHpu+uoSi0U4qSeqYYtrxlt9uR2I
	/8JTBfGw==;
Received: from localhost ([::1]:28012 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hV9az-0025Xy-9w; Mon, 27 May 2019 06:58:57 +0000
Received: from [2a01:4f8:192:486::147:1] (port=38834 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hV9au-0025Xr-23
 for samba-technical@lists.samba.org; Mon, 27 May 2019 06:58:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=QRymIhKNXcgdzkepzkmFAMSEKp/p0yyxh5N3hf4yLWo=; b=Hk97gN0KOt/k1nzM+TL1DNzDXA
 L/b+UPTdEWxEbNUU57kelA23+/zbVxP0SD8ixbPLTT6CWAGbKvMmaDUvW4jO0U2NHviDKC3ugEG+q
 FIYXm62oKqIWPqIeFs5L1wEwU10oWoxxRCzp5NEOFCuIMHPeKTwHl8Btvj3CAQV0fXS0=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hV9an-0003du-NG; Mon, 27 May 2019 06:58:45 +0000
Subject: Re: Kerberos and Samba client tools
To: Andreas Schneider <asn@samba.org>, Steve French <smfrench@gmail.com>
References: <CAH2r5mvmJVe0i+aAidvpnmHPdxX=V6RJ0dYdQZfBY+K7zq2o5w@mail.gmail.com>
 <2585169.WRIv5fHKiD@krikkit>
 <CAH2r5mtRNey4Fx5-ZsrCu4Omgn-bVrmq0zKkprZ4=mrRSb6BOA@mail.gmail.com>
 <11826585.dasZr9x98r@krikkit>
Openpgp: preference=signencrypt
Message-ID: <9fb4fd78-5f0a-cc15-ba8c-e86d8227895e@samba.org>
Date: Mon, 27 May 2019 09:58:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <11826585.dasZr9x98r@krikkit>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 5/26/19 9:26 PM, Andreas Schneider via samba-technical wrote:
> On Friday, 24 May 2019 19:30:33 CEST Steve French wrote:
>> A related question (to your "--user-kerberos=yes" (or auto) is "which
>> ticket will it use" and "can you get a ticket on the fly by specifying
>> this with userid and password" and can you override which users ticket
>> will be used in SMB3 session setup?
> 
> --use-kerberos=auto
> 
>   Check for a credential cache and try to authenticate. If it fails ask for a
>   password for the user who executed the client tool.
> 
>   -U check for a ticket of that user, if not available ask for a password
> 
> --use-kerberos=yes
> 
>   Use the credential cache
> 
>   -U use the credential cache and check for a ticket for that user
> 
> --use-kerberos=no
> 
>   ask for a password for the user who executed the client tool
> 
>   -U ask for a password for the given user or use the one supplied on the
>      commandline
> 
> 
> Makes sense?
> 
> Comments welcome.
> 
> 
> 	Andreas
> 
> 
> 

I like the idea that it's clear how tickets are being searched and that
there are options that cause the search not to be "everywhere".

How does that interact with -k switch?

Specifically, when we ask for a password, what do we do with it? Do we
only use NTLMSSP (as --use-kerberos=no implies)?

If the --use-kerberos param mainly decides how Kerberos finds its
tickets, then perhaps it's a misnomer (--use-krb-ccache ?). If OTOH
--use-kerberos=no really means "do not use Kerberos", then we seem to
lose the ability to use Kerberos to obtain credentials into a memory
ccache, based on the username and password, and authenticate with those
credentials.

Thanks,
Uri.

