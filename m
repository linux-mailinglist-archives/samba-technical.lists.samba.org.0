Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B11D7EA46E
	for <lists+samba-technical@lfdr.de>; Wed, 30 Oct 2019 20:51:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=zMcXXnKm+ObFHdiJYvOxGL3b2NlCh0XD3biRmKUgej4=; b=kDCDatCszT7PCIagXEPxZWc2C1
	zd0t2CPMCdEbYV18vDt4cc1myTYUrgpBE5aF8i1q190k9SyWzy2JaET/uUHJd2dLFdsxLlSqA4ZV0
	yYdLgKZEdwENTLnakMbcyMoBXRphq8WYLoS/F/KRBLVkciogSm10jnTTcfakQhC04i5XLi9RZbyU+
	V/Xo1u3bhC81bkL633F8zT/nkObZlaVHAupC0qlhsCZeJcS3QEUvmIaQMW6wGDYXKYhoYqrlaP6t5
	eJsEuKNu8IG5tEBm3eMgIkIHDkXJ5DFEpFXuwHvaFMtUetQn1lx1DSqgMVBKZhZ2ejow65iCz7dj7
	TECYo9rw==;
Received: from localhost ([::1]:35708 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iPtzR-003o1v-Cw; Wed, 30 Oct 2019 19:50:45 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:40414) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iPtzM-003o1m-6U; Wed, 30 Oct 2019 19:50:42 +0000
Received: by mail-il1-x130.google.com with SMTP id d83so3247387ilk.7;
 Wed, 30 Oct 2019 12:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zMcXXnKm+ObFHdiJYvOxGL3b2NlCh0XD3biRmKUgej4=;
 b=dKvJFkTZ75LRZqPbH4alfouv/IsibSmm/lEkoFydB9eoQsawYqYctqZ8eO9vVj5Bbt
 O79WdZiQdtI5JZam3XlvQGm69CnbcB7XVkqOVBiBXxNIV5E+aZUXSUv7puaKuttr4FXm
 bFn4Bss15iPoCHzjRMaHh8r6DPZGB2JgPUgkbXsAq0CmAqfRcwMgGbzdnmoCcEZa/rAT
 NyMnt++Pn7B+XWgxFg4mo/5JiYM9CTPAZvPD9p1ExlNmGddLGNY0To3bhw50EWgmh79R
 Wlx5x/EbQpTu5E8I4j4d18Ht2jzyd41/CNi1ruLrP8QjAicmVtQtpWTxkA+9Cz9zP1X+
 wxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zMcXXnKm+ObFHdiJYvOxGL3b2NlCh0XD3biRmKUgej4=;
 b=gI0gVooqv8k0AiiyvCgD4ePdFSq834PjP6tNi91msJKS14MzrFnK0ZncURT1qKKjoz
 HuAmE16e0jjX6cL9IHM6BqrP/OpWiqN4punbUFmXdoaLfFnXjTw0OQE/y5eigm52oo6y
 AXB9tcp5Vv+5sq5lXdAYW8Z5IMoKerA60oy/SENKA4+Z8zAIErzE5ANM9eLJ1eGEe1zf
 soclG4zTztx4yS0oFj9XoM6W8ba2Wd6w3OXAeoOUb9u5dwvtNhOBm1L8cFHSJU3iPviR
 ShjixmA6MN+hkzXPQ61wfrpc16fHrOQb+963wttZ2+vClVaUfq5qbP3eARr8NCQhIKEY
 9RsQ==
X-Gm-Message-State: APjAAAX2xcxxIa8lhOJLyo3vstaY4mW6Sqdg4dZgX2bNKqPUDJgo7BmY
 1Ssqb9iWdlkHxS08V+UsVV3M4OEb/3N6eN+zaFrXG23z
X-Google-Smtp-Source: APXvYqyw53QYZR0waEzsWJW754QKkED96IWUsmF2QIckXxmBJE3LQyHqH19FeKpmY83Ukw32s3LKiqt8bi4e63Qh4EY=
X-Received: by 2002:a92:1793:: with SMTP id 19mr1972466ilx.3.1572465036980;
 Wed, 30 Oct 2019 12:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAG+HqKTMYkd1ynUUVZrWJy-Lu3vQwe+6kHVrghhnd9s-YAoSCg@mail.gmail.com>
In-Reply-To: <CAG+HqKTMYkd1ynUUVZrWJy-Lu3vQwe+6kHVrghhnd9s-YAoSCg@mail.gmail.com>
Date: Wed, 30 Oct 2019 14:50:26 -0500
Message-ID: <CAH2r5muSXNb5Fas1Qab1a4A-gKX-05c6eyvh0SZXUrO1wkAPvw@mail.gmail.com>
Subject: Re: After configured server signing, file transfer speed is very slow
To: VigneshDhanraj G <vigneshdhanraj.g@gmail.com>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Samba Listing <samba@lists.samba.org>, Andreas Schneider <asn@samba.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

In my testing signing is slower than encryption (but only when using
SMB3.1.1 GCM e.g. to Windows or Andreas's Samba GCM branch). With
Andreas's GCM SMB3.1.1 in Samba, I find there to be no need for
signing as encryption is faster.

On Tue, Oct 29, 2019 at 1:56 AM VigneshDhanraj G via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Hi Team,
>
> After configured server signing as mandatory in smb.conf, file transfer
> speed has slow down.
> Almost 90% speed has reducing. Kindly do the needful.
>
> Please find the below configuration:
> [Global]
> available= yes
> restrict anonymous= 0
> server string= Test
> Workgroup= GNANA
> netbios name= Test
> realm= GNANA.COM <http://VIGNESH.COM>
> password server= 192.168.1.14, *
> idmap backend= tdb
> idmap uid= 5000-9999999
> idmap gid= 5000-9999999
> idmap config GNANA : backend= rid
> idmap config GNANA : range= 10000000-19999999
> security= ADS
> name resolve order= wins host bcast lmhosts
> client use spnego= yes
> dns proxy= no
> winbind use default domain= no
> winbind nested groups= yes
> inherit acls= yes
> winbind enum users= yes
> winbind enum groups= yes
> winbind separator= \\
> winbind cache time= 300
> winbind offline logon= true
> template shell= /bin/sh
> kerberos method= secrets and keytab
> map to guest= Bad User
> host msdfs= yes
> strict allocate= no
> encrypt passwords= yes
> passdb backend= smbpasswd
> printcap name= lpstat
> printable= no
> load printers= yes
> ntlm auth= Yes
> server signing= mandatory
>
> Thanks,
> Vignesh.



-- 
Thanks,

Steve

