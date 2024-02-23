Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5D9860B7E
	for <lists+samba-technical@lfdr.de>; Fri, 23 Feb 2024 08:45:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=PTx0+VDEpjihS0VK4gN+rHpcsxENJM3qscl49fkssaU=; b=0KZe/txTiFfonRusPVmQ/Mh/W7
	3d5dLUwukZFXq5X+E0yimBpEzryoPAWwcm7EEnNijtOuy2JlXJm3IJj8ONElhvF7+blROLwEo8a9B
	5weKCRWnn3us61JreXqfp2yxxyMHuEkSgE8o1KTlqMJQ/8NNsr4/XQt9RXAAbiIdt49wKuR3qP2u6
	i+4ExO4EGnGdEZiCAfK963t4sNbjNu5tq+8yEZfOWoldWyoKJcgXDD+C5EhSwDHm94aITfPgNmaV7
	x0qDny7EplFgP1VqZEFqkyOLuI6xn/ZySaaNDWtzPxWjcbG9EQ1lecTh9DY9WxIlRII9B2Vo+JiuH
	S48rVmNA==;
Received: from ip6-localhost ([::1]:38010 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rdQFS-009EWv-Ha; Fri, 23 Feb 2024 07:45:34 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:54745) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rdQFA-009EWm-4j
 for samba-technical@lists.samba.org; Fri, 23 Feb 2024 07:45:19 +0000
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d23d301452so7491281fa.1
 for <samba-technical@lists.samba.org>; Thu, 22 Feb 2024 23:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708674314; x=1709279114; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PTx0+VDEpjihS0VK4gN+rHpcsxENJM3qscl49fkssaU=;
 b=JzJkFwq9DOciMFBhnrs8Og/Dq/+vRaOktgm+dM15TthrCGBVtftQqYTPIvggHAvlN/
 cVqPA77zcyMZUolRsekdBDV7skHZZdWUMeFB5+jtaFkknKpPl5qNOVgxQCSGACgnLxV+
 IcBuRNuzB0/YNw25Z8JzbLUxGLrFAZ4+D48o4nARcgQXR9wjFdjCXHomZ2pCWwaCseGM
 21wxP2Btgygi9ef9e+Dn36Rvo3n6wjwv+CUEiqryM2eZVqgjQLHEWJzQYxt44OfuAv1R
 0wxA1pFsBGbLhwo8Zo0d2guTTbvwz8MQbZFNrBaLYNmsHgWyMJtUrQFd55IMi58ZpvKQ
 yDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708674314; x=1709279114;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PTx0+VDEpjihS0VK4gN+rHpcsxENJM3qscl49fkssaU=;
 b=LbBFn3rPlxJPEvklH6QrG408u81HEo1eS9Rcx2m+uxCLAFy6+z5mJRcnBWfeyKGTkv
 o/VEoLkBnxi5B2IGE3Rdhg3mCCWwoxF83KlxprWJyruJHfVST/Cmfqj7DLSvlmEgIrJW
 JRaVvT8m2wFi8aCgK9jzalO0SJy/8syZ3kWutwFA9yI9OGUaxDT8lLlAJg5qXBlP7aUr
 3+MtgFvSaFuT++bSfpfAbKGMnwFXklW+WsToRtJFaes5KfG8nsDWXnNmrEbY9JInXMHi
 BYIZY9ZFRnAbx1o9BSb7K2fE+tfi7wBD/Ivp7UdLFoKBoAMstBgI2N6WiQiheFdECRu0
 fIiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRoDQhCHxtWtN9gNjytRjbVt2Q7v6jEq1udVZoe22Bsd+uCkVF3PNrx8qq7uwdH0XsS1gi75mBXfQXVET6rmEnRF1o48kzsumN1AWOKgcX
X-Gm-Message-State: AOJu0YxosZaojI4eZtaZOuqxhEp6ARo2b5JivDEwb3pjRjDDzpms3hAg
 db60RPXcObncSTA4+eISZ2DRYWp27JjhmBTY+lNp9F6qRnOfJL9JAHg5D8+pS6TlZFN18Uh/9LD
 /hC1zdQZx43MdAn4nobjZIHj+ugY=
X-Google-Smtp-Source: AGHT+IFVrZzOmpjtrN24auFlcWByGCW36InI9s7KQUA+kkUOO+bGjUAeJhunXHJAxLaWEbhtezy/UHv99vB/WMNYJmo=
X-Received: by 2002:a2e:a549:0:b0:2d2:3a89:b97b with SMTP id
 e9-20020a2ea549000000b002d23a89b97bmr904457ljn.24.1708674313641; Thu, 22 Feb
 2024 23:45:13 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mtUnLDtwbW7or=Uc+AXkzLpHsJoPuoLE7yyjPVYjvZCow@mail.gmail.com>
 <CANT5p=oNRF9BAgybCX7dE+KvYj=k2G3tERa+fMJOY6tsuZ00Hw@mail.gmail.com>
 <bc2eaf5b9eafe2134820d1ea8c07e43f@manguebit.com>
 <CAH2r5mtSB0nDKxAJHtnp6USgoeVN7hNF79NaOcX_pnF5MVPFhA@mail.gmail.com>
In-Reply-To: <CAH2r5mtSB0nDKxAJHtnp6USgoeVN7hNF79NaOcX_pnF5MVPFhA@mail.gmail.com>
Date: Fri, 23 Feb 2024 13:15:02 +0530
Message-ID: <CANT5p=qTe2XQJYVdYiVkc34WdsE4ekHaH0f4uMwUoDtSNchwug@mail.gmail.com>
Subject: Re: [WIP PATCH] allow changing the password on remount in some cases
To: Steve French <smfrench@gmail.com>
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: Paulo Alcantara <pc@manguebit.com>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 David Howells <dhowells@redhat.com>, Bharath S M <bharathsm@microsoft.com>,
 Meetakshi Setiya <meetakshisetiyaoss@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Feb 19, 2024 at 4:29=E2=80=AFAM Steve French <smfrench@gmail.com> w=
rote:
>
> Updated the patch to allow remount to only change the password if
> disconnected and the session fails to reconnect due to continued
> access denied or password expired errors.
>
> Any thoughts on whether I should add another patch to throttle
> repeated session setups after access denied or key expired (currently
> looks like repeated every few seconds) maybe double the time
> repeatedly (e.g. until a max of 10 or 20 or 30 seconds? between
> reconnect attempts) instead of every two seconds.
>
> On Fri, Feb 16, 2024 at 8:41=E2=80=AFAM Paulo Alcantara <pc@manguebit.com=
> wrote:
> >
> > Shyam Prasad N <nspmangalore@gmail.com> writes:
> >
> > > need_recon would also be true in other cases, for example when the
> > > network is temporarily disconnected. This patch will allow changing o=
f
> > > password even then.
> > > We could setup a special flag when the server returns a
> > > STATUS_LOGON_FAILURE for SessionSetup. We can make the check for that
> > > flag and then allow password change on remount.
> >
> > Yes.  Allowing password change over remount simply because network is
> > disconnected is not a good idea.  The user could mistype the password
> > when performing a remount and then everything would stop working.
> >
> > Not to mention that this patch is only handling a specfic case where a
> > mount would have a single SMB session, which isn't true for a DFS mount=
.
> >
> > > Another option is to extend the multiuser keyring mechanism for singl=
e
> > > user use case as well, and use that for password update.
> > > Ideally, we should be able to setup multiple passwords in that keyrin=
g
> > > and iterate through them once to see if SessionSetup goes through.
> >
> > Yes, sounds like the best approach so far.  It would allow users to
> > update their passwords in keyring and sysadmins could drop existing SMB
> > sessions from server side and then the client would reconnect by using
> > new password from keyring.  This wouldn't even require a remount.
> >
> > Besides, marking this for -stable makes no sense.
>
>
>
> --
> Thanks,
>
> Steve

No major objections for this patch. While it may not cover all cases
like DFS, multiuser etc., it's still a starting point to allowing
users to change password on existing mounts without unmounting.

Steve: We may want to check additionally that sec_type is not Kerberos
for this remount.

I also think that we should have a future patch to update passwords
using cifscreds utility even for single user mounts.

--=20
Regards,
Shyam

