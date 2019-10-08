Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D3774CF7E4
	for <lists+samba-technical@lfdr.de>; Tue,  8 Oct 2019 13:12:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=3Apm1RF1TYJvfHYPSptzB7y2vT9LZub8/UWZXlt8RvY=; b=4UkGLJcqlaTWjGLf6BXs236GvT
	vgiCta0ikVOs+xBkfQPDpAS7LAXqXOxY69wA9C6dmuNhJbMT8DQEjBs7W+4g1MLurI7aTBF/odIVw
	LwqcsAjALlpy7Dn6l1PK3FEKq3gEQhpO0dtjRTaJ47mcAHf4mEe6vMnTeRljiVkD0caGN2tisj1Hy
	li4j6tCSsj3mr/OQet6ZVzR0rIx3wRooe+rH1lxI0VzkqvFfn1BJT8NMIGIiinuSTjOfgeuViTAMf
	Greu7Ctt8NAzjjARfrb9kAe7tTA6tN/OAVARhIK5elsJMt3ZGpJP6yMABUSdUxwXx9hzt8bzZDiQh
	4NSKQPdw==;
Received: from localhost ([::1]:45762 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iHnQ9-0024TZ-6a; Tue, 08 Oct 2019 11:12:49 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:43230) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHnQ5-0024TS-03
 for samba-technical@lists.samba.org; Tue, 08 Oct 2019 11:12:47 +0000
Received: by mail-lf1-x132.google.com with SMTP id u3so11595716lfl.10
 for <samba-technical@lists.samba.org>; Tue, 08 Oct 2019 04:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3Apm1RF1TYJvfHYPSptzB7y2vT9LZub8/UWZXlt8RvY=;
 b=J3FoMyuse+EDpuPr//fbeFs1rptwmW7n0Ca383iR4oeB/O6zfsTv7R5b7Xb/zitREK
 R3OKYhvmyJuSS4MYUXMJ2YPIULPrVhgIBtn8Dx9KMzNznlq6L9BZoPhtCOTPLSHgD5TL
 qFrHc2VebzWCreeopCIlV5zkvZWxqPq6W04p0VKqJOWw1kyXTHJIFpFX9YFSeIBlVRp7
 I4u4Av3m+EUEW0lG8wIqQJ1Ams8yTBC4qiZQFdEqjkiy6phz+Mn7ymyoLrPude2GU0eo
 qzmwtnRgwk/nylZVW7VuWbXSG4Jem3GDZpM/tN6LJoFcc1xftVxNwHz6+vvoRM8Vyvys
 HgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Apm1RF1TYJvfHYPSptzB7y2vT9LZub8/UWZXlt8RvY=;
 b=e1TnUDxhLVNyQ2rDlFR+1SKMer1hTiORvbiiWK1CpsBHJZVPyRp4LrUtK9ruSbv/IR
 RCcn7565yE/wx8uY0NSY2gPG60e2oD7y2dvU1YWDGzK3eKYxOcpMJPj9tf6Bcm2cf4Ne
 2c6a3TDyCOEiESHAA1StD+tReJBK60lr0X63Disqw3bfPlxQsgusCv8S8KqkJAmtH6g/
 z/8Z8CySJspMAyX4yf0KDb33YuDrcMfvl72SMsYficnJ5QPQhL77LjhQOeFqIzlEp5BR
 i8u5b1aT9smMvEBrDdjVzdc7xXyqY0BOMYzMrNQChOCgadcZOLLr+tAJ/YTuVVDA2FFq
 3AeQ==
X-Gm-Message-State: APjAAAWioUd8erZoLluPHinfmNBUwFLfArjCBiDmY++CkpUK3dDe+et3
 lY1RtscvGr0BV7n3V0MQO+5HcNV6BclIVuBsfZzvFw==
X-Google-Smtp-Source: APXvYqxaRbsbDRtVPv3oTE/H6lSUiIvX+I/QMHCIae0xtMJ/JxjE3fDB6j3iAcjirR1fNusSWVRTlesrmS0JrIFrtFk=
X-Received: by 2002:a05:6512:488:: with SMTP id
 v8mr20170073lfq.37.1570533163876; 
 Tue, 08 Oct 2019 04:12:43 -0700 (PDT)
MIME-Version: 1.0
References: <5849953.E8HlOTvGIY@magrathea>
 <d7532a8d-aa6b-4f30-efde-891b7b5b8333@samba.org>
In-Reply-To: <d7532a8d-aa6b-4f30-efde-891b7b5b8333@samba.org>
Date: Tue, 8 Oct 2019 13:12:31 +0200
Message-ID: <CAC-fF8TbP+jLsCxEO_knBWSR-2=Y6y+NpKEBA6+7Wz-pQec9pw@mail.gmail.com>
Subject: Re: Samba and legacy Windows support
To: Stefan Metzmacher <metze@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Andreas Schneider <asn@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Oct 8, 2019 at 1:06 PM Stefan Metzmacher via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Am 08.10.19 um 10:59 schrieb Andreas Schneider via samba-technical:
> >
> > * Can we remove NTLMv1 and LM keys for Samba 4.12 (remove `libcli/auth/
> > smbdes.c`)?

As noted, that would also remove mschapv2 I think.

> > * Can we remove DES and 3DES Kerberos support for Samba 4.12?
>
> Yes. The question is how to store the keys.
> Is there a way to disable DES on Windows, so that we could
> check what they store in the Primary:Kerberos-Newer-Keys
> and Primary:Kerberos blobs in that case.

Thanks Metze, I'll look into this.

