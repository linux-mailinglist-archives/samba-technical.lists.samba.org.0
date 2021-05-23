Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3618738D854
	for <lists+samba-technical@lfdr.de>; Sun, 23 May 2021 04:37:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=NkGqd4k53BMXwjja9+wvjjI9pdHrq5VLDgaEoS0K1w0=; b=iouk3mtsc2C1oa5Bt9QcrlRz9l
	PS97G6dMrKBk+zBoWICKgqEOMSQFEeQqajC9wqmemh7Ye1U+7utUon0PzV0SHi92C/gSezwWsfAXK
	0OH+DujdQ0CAHXbZw7rdp8FvPu14DvQohrs4VCk6lCP1nuH6bDSDZ35ghEhWEJDRFj3LTHUFomPBB
	Egz3CsqZ37yDlBm+NNfAg/FTk49Ms77A62xq0YClZnw+9bDqyJe5Xc9VmB0oHpngSjDeIGaTUTupu
	Qz8yzucUuz6kwFmyE7IB4Bl9Fqa+EcwQPdklGTchcPhgl+aOxNr4jKF6ICyOxW5hUWMiY+LrshEpp
	Rnj91MOA==;
Received: from ip6-localhost ([::1]:48672 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lkdyc-0037IB-3O; Sun, 23 May 2021 02:36:26 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:33498) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lkdyV-0037I2-On
 for samba-technical@lists.samba.org; Sun, 23 May 2021 02:36:22 +0000
Received: by mail-lf1-x132.google.com with SMTP id c10so14472024lfm.0
 for <samba-technical@lists.samba.org>; Sat, 22 May 2021 19:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NkGqd4k53BMXwjja9+wvjjI9pdHrq5VLDgaEoS0K1w0=;
 b=gxeyTaWjWQ2/QslbA0YaCi0fUS3wPrRcYacWGUVUBXLQvxMsq6qNrGtPh7EuZ8nmlt
 r17YJfc3Gv7n192UF4B9MG31VygXGqASmY8tyGn4e3f9OlB+pKf6KDjSXLndAY+YWPVb
 CgxO6MFYA2mFgE6k/gQW2HtiywGMQvf4dSQjnUM9sdB8W4gPDxbocR7zDjYbYlrqUaKn
 N2l4DIXS/xogszW0ooQxotsMQjlufXqIEyn80thkoeFvhyugwVx6sPXZ+LktGuEqXBnD
 UT2BMua96v51n5WzvV8ZQD7DdqwplrXnjD247VB3GbLIL2TeG+8UAm6h3YKFeFtMIK62
 8kUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NkGqd4k53BMXwjja9+wvjjI9pdHrq5VLDgaEoS0K1w0=;
 b=nvH5B9mNvyCRemji9xvwc4SpOuj9yu3e3jqHn4UbobHEIkMt6fo0sQ1G7844A8mqzY
 1K+aLOHCFnt/vKgqI5kSBa/Zy3B6SQsvdowO98KqWJubauwq+nIrhmUr9wn9vIoacAi2
 KxcTS1S73uYXcMgtoUonXeDpb/fNwkZtAi535/5VHcDyz58HPzkcIfyXvmcrwL0NHGpH
 2Ibgr9mC/GkW7jx6mT8tFy+YSEe8AxHe7qfzeGOb2SA4JaWAssLNfwD3AFVA8+e84Gho
 It4/+waqlqfGNqM7B+haM2sNlQZKubZT2aZxkVnksXfI6uKFm0sYnAmdZIi3fHFnk3fX
 bY0Q==
X-Gm-Message-State: AOAM532+MTV6IyuBKi5iCG6AO3bEbh5JcAE7PMz3kRm8hUrdS1OhqlBe
 3afdadTy2A9UUmdZszq+VQwnv4U0EhmvX+IEMsA=
X-Google-Smtp-Source: ABdhPJyYeFI4q2C9mD9PW9pKzF9kAjVifvOLTDg0EXYi50/aq2X7GL9aFDPeQ7k93ZE2s0K8xTRia5xYHi2SJG34tDE=
X-Received: by 2002:ac2:546b:: with SMTP id e11mr6508563lfn.395.1621737376856; 
 Sat, 22 May 2021 19:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210521020051.196434-1-hyc.lee@gmail.com>
 <87o8d4qxyi.fsf@suse.com>
In-Reply-To: <87o8d4qxyi.fsf@suse.com>
Date: Sat, 22 May 2021 21:36:06 -0500
Message-ID: <CAH2r5muZDKC1uZM-q2AGe1f50WtxCHZEPS0oHTBQtROJCZ0QJw@mail.gmail.com>
Subject: Re: [PATCH v2] cifs: decoding negTokenInit with generic ASN1 decoder
To: =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
Content-Type: text/plain; charset="UTF-8"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>,
 Steve French <sfrench@samba.org>, kernel-team@lge.com,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, May 21, 2021 at 3:44 AM Aur=C3=A9lien Aptel via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Hi Hyunchul,
>
> The existence of multiple ASN1 decoder has been a regular complaint,
> this looks nice. Have you tested it against any servers?
>
> I think we need to make sure it works with Windows Server (including
> increased ones with the increased security flag, Steve do you remember
> the name of that flag?) and Samba at least.

Are you thinking about the authentication problem to Windows when a
stricter registry setting is chosen for server name hardening?

This involves populating the ntlmv2 response area of an NTLMSSP blob
with the  "Target Name" attribute ie missing MsvAvTargetNamefield and
maybe also
MsvAvTimestamp and NTLMSSP_AVFLAG_MIC_IN_AUTHENTICATE_MESSAGE in
MsvAvFlags.   These (the target name field in particular) are required
when Windows servers set the registry parm SmbServerNameHardeningLevel
to 2

See e.g. https://docs.microsoft.com/en-us/windows/security/threat-protectio=
n/security-policy-settings/microsoft-network-server-server-spn-target-name-=
validation-level

> There is the SDC EMEA plugfest coming up, might be a good time to try it
> out against other vendors as well.

Yes - definitely need to try with various cases (krb5 and ntlmssp in
SPNEGO) to various servers (Macs, NetApp, Windows, Azure, Samba,ksmbd
etc)


--=20
Thanks,

Steve

