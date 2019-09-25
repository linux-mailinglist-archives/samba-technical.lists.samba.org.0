Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4747ABE26F
	for <lists+samba-technical@lfdr.de>; Wed, 25 Sep 2019 18:26:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=FZZymNNWe9ccDbfoJjfQ5SN6fVrwS5ZTDEkJFlYtKZg=; b=Y7VTZZmoxb0pEvEd2THeMShrzA
	9ONqK2OYnlEfbEvM+U+P8h/evvpw4MEZnmLsRlYBWkxjT9hw5B2G00Dy9ugZ2i14lp1q4b6ioih2W
	J+sbR93NqtR2NGlQPbc6n452CezqJZN3QtJY7Bt9Y6n/H1daCXOsX3yuxSRPjMnfiXtIqeifC2Gp1
	3TT+4lzWVX3B2pwY89i31NUscwwo4iXtmBm7wZTZhrOXo1pu0zpHbxfGb/qbtjq89o7e1hnyvV7FV
	ktO3n76IiRt8c9pLHVyPTohpQsHVD7ODyDDkPQg1wfvSz+MgNdDO8B0l1klKNcNmD+0409SRC1f1g
	v6kQnlqQ==;
Received: from localhost ([::1]:49858 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iDA7s-008Zpl-Ek; Wed, 25 Sep 2019 16:26:48 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:44141) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iDA7l-008ZoN-AD; Wed, 25 Sep 2019 16:26:44 +0000
Received: by mail-ot1-x330.google.com with SMTP id 21so5354789otj.11;
 Wed, 25 Sep 2019 09:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=FZZymNNWe9ccDbfoJjfQ5SN6fVrwS5ZTDEkJFlYtKZg=;
 b=a+h+V9QwrdWtmoeKHp0o5Mx9M/MoRSxjGwLmc9wM9Q/qIUZRPJkFxdCfaXicaCJQju
 MGgv6H2oWLX+n4Y4YS9W3K5RNCGP348iR1Veqc9iwgkFvk1eGIFi3UMGPD6N/E4Ep4cj
 hu/b+WMFM1EtNHThfbN742s0Dx5d+Wo81wpcSfvi3ciR1sWuJVXq6eBaF+ITSZGxc3sQ
 MLW6o9eBBNxyTd8pHOpOcZFOnHSAXrfk67/M4/8PN+QqYdpEKO7x8JhLPc6Gavx5K0Oi
 vMv7PjXuQZC+i/nAYLLHQDzpZKlf/Cf4ItIxhoeiLgEERsukNgA2KfhHEVzdbhYFmdcE
 URww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=FZZymNNWe9ccDbfoJjfQ5SN6fVrwS5ZTDEkJFlYtKZg=;
 b=fCOKG8l6BKVwB7AYFnrYZQL8L5KpmqtTxZAsIBdBcsYjaGHSe+/+Gl/fD0NbtqsS6f
 hLeaqc9DC6ZOGJTfRsQ78qQsXyugepGy038mHTWyJDQ2ah84zZcLoz37SWU6rlJ8Ulpv
 BwB8MfG3syc9cs3wGCPZSSCekiquUP0M3Mzvx9/AOzlKGKP8/Xid86Ap1X//JnVHIm+i
 JOLYMuOr+UG/TPYccJIbDVXaK69RcM9WkY0lAMmtl4vWcLddMGlbBAXbCaXFt/pgx62x
 maqBycCiGxq+onSrY39AVEjDe9XslqFOeaGICxn7y0unyUZqxLPDGab7A2i6svzB1YCF
 4WMQ==
X-Gm-Message-State: APjAAAUh9m/MyD72gn0JC/VWhq0wUhy+b6z/qQZiUjSpBYHpyl/CnzYs
 rm+NGbL3MpnHUA3FpLoNtbxbcIYoCuHYYgCy3Xg=
X-Google-Smtp-Source: APXvYqwgCOfr9uN+pESgFgUZH5Y8OyjAwsuMlWR7hi+Dmib4OqW7762vIdkiQoJsckXiP9n91D8K/pDR8BJPZxbCchk=
X-Received: by 2002:a9d:629a:: with SMTP id x26mr6850273otk.120.1569428799150; 
 Wed, 25 Sep 2019 09:26:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:4b0b:0:0:0:0:0 with HTTP; Wed, 25 Sep 2019 09:26:38
 -0700 (PDT)
In-Reply-To: <20190925155916.GB21234@jeremy-ThinkPad-X1>
References: <20190925155916.GB21234@jeremy-ThinkPad-X1>
Date: Thu, 26 Sep 2019 01:26:38 +0900
Message-ID: <CAKYAXd-WZRSXZDh9hztuCduoVerOBVZYyULugkgAUn_rtu9G6g@mail.gmail.com>
Subject: Re: New minimal SMB2 client library !
To: Jeremy Allison <jra@samba.org>
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <linkinjeon@gmail.com>
Cc: samba@lists.samba.org, samba-announce@lists.samba.org,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

We have used this with kernel cifs client.
It is implemented by C languge, Moreover LPGLv2.1 licence.
This is what I've found so much.
libsmb2 can enumerate shares, and mount -t cifs using share name
getting from libsmb2.

Really nice work! Roonie!

Thanks.
2019-09-26 0:59 GMT+09:00, Jeremy Allison via samba-technical
<samba-technical@lists.samba.org>:
> Ronnie Sahlberg, Samba Team member - has
> written a new small-footprint SMB2/3 client
> library. Compiled size is 120KB (yes, that
> is *KB*, not MB :-). It supports signing,
> sealing, NTLM authentication (and krb5
> with external libraries).
>
> It has *no* dependencies (other than the
> afore-mentioned krb5 if you need it) and
> is available for checkout and hacking at:
>
> git clone git://git.samba.org/libsmb2.git
>
> License is LGPLv2.1+, and it is developed
> independently of the main samba project,
> so please send patches directly to:
>
> Ronnie Sahlberg <ronniesahlberg@gmail.com>
>
> Submission of patches grants him the rights
> to integrate into the code under LGPLv2.1+.
>
> It's designed to expand SMB2/3 use into
> the small device Internet of Things and
> is already used by the VLC and Kodi projects,
> and someone has ported it to load games
> off an SMB3 server instead of a cassette
> tape for a Tandy TRS-80 (for the over 45's
> on the list :-).
>
> It will *never* support SMB1 :-).
>
> Thanks Ronnie for making samba.org
> the home of all things SMB !
>
> Samba Team.
>
>

