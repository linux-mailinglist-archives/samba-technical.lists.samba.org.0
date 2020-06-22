Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D835320324F
	for <lists+samba-technical@lfdr.de>; Mon, 22 Jun 2020 10:43:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=zATWOhzdkOU4f7KAD/BsGOOexWBdyjaj+6/wVi7pwYw=; b=IoOfkbSDymzmaShfTwO/AfFrIE
	lxMYruV3uqd7B/P19lzSZlg+Xd58dIT7s8X+GEPI2X8L5ew2jK135QdPT5YHtrZJ181UQaug9RQVy
	45tSIVQvTMKJR1PAIWXQ2W4iGlLwoM4LPc22Wvzu0+sONuKZi7w4UZcfFGQZXjDVkvGyqvjwUVOuT
	U9uJI03wxSmJhxCxeQ9Pbye+hPVCTqfWbl77WYfytcAN35D8ICQ4rhyM944VKQjkgM3CWva1sTgDn
	NIESDIGKDHUh8jh/1alJ0UBxvnrIgI74l3C2GGO7qZos0GNkhdPZIqGel9soy1qTWycbVpXDCDzZg
	Pf1g7AOQ==;
Received: from localhost ([::1]:60670 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jnI2q-001jGy-G6; Mon, 22 Jun 2020 08:43:12 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:35230) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jnI2j-001jGr-TC
 for samba-technical@lists.samba.org; Mon, 22 Jun 2020 08:43:08 +0000
Received: by mail-lf1-x12a.google.com with SMTP id t74so9126360lff.2
 for <samba-technical@lists.samba.org>; Mon, 22 Jun 2020 01:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zATWOhzdkOU4f7KAD/BsGOOexWBdyjaj+6/wVi7pwYw=;
 b=QbDQN2OabWXnDXsdOVa4xTms6XkpiMpiLjmdtBQc8+Lst7KuaGHgxFoqyl/8xfBXJj
 vt8UDNuRHcFjew3yHbu/lu7ctmfcQ5YjvNdMFSfBqXHFDUKxM86KqcjRZeEPxRCtnYoJ
 w9d8/azO2WnAloCdH+oVEnfyTokJ/vjU0VAYR/+NSUSDhoRJFAj/tATGjiqvzQ3OZnBt
 zDcLxzzC44ToSW8obP2sMKMTm+hdPhO7QKNQ0rJmfq36aer7WR96xqGkke/uudC8zF/0
 BfRSIPX8jlzAziuUS67J9RVZRc7kQcwjmtcnCRE5YY+tGBLngar5586L1wNCNCWCXek3
 jXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zATWOhzdkOU4f7KAD/BsGOOexWBdyjaj+6/wVi7pwYw=;
 b=iD/wvng/6DlAiNw0fJSLPw6SUqVwkup7KiDIiYn1w1jpu7O7L0rYLF/rukaA8hVRea
 x7LjHd7aFwPZV19NZsHIYLsq+PacRt8lt8ZXo/UApkCr53KS2D3MITpiNw2WE5fLhS7b
 i1fD2IhphQUPJj4TBK6cTNdgbGomP3j26DhHUMxNXWbchUht1lC25o6RtiVN1/dE3XIV
 DYuYPcrLocvzPyVgATEvVqElbxb87E//RMmtJuQIvsH5aL/yJiBnawScf/uORIa51CKx
 TZZhk/mQnwdT6CEeU+u1I8X2/KI2X0agnuBcusVg52SA7cBWvLnF6llXp0O6DXAdfFsI
 JbMQ==
X-Gm-Message-State: AOAM532YBlUoOe8yNOWHaOhHq+X9F6n4sHlpf1c5Ui6HfCmSEj+l+k8Q
 2WHpKcTTB7sV09kZNzaKKG+nmUIM3D0feMWVsWuVUyDd
X-Google-Smtp-Source: ABdhPJyUxGtVgJnJNvXvNH++w7ndOruAkY+0GVg+IndCIBk/gl2JZzfNUsqU6Kh4cEtdfezDSB32ETrVjhZsN0zJ7ks=
X-Received: by 2002:ac2:5a5e:: with SMTP id r30mr9159195lfn.30.1592815383917; 
 Mon, 22 Jun 2020 01:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAC-fF8TH5sf6ekjfG5QqnEwG41fopV1bWOMxBH_UnodfjDo_qA@mail.gmail.com>
 <20200619181956.GF10191@jeremy-acer>
 <CAC-fF8SYbXaz33yJ_QaZzeYh2uBt3iKxHzbQNtMPm5qqwvAciQ@mail.gmail.com>
 <CAC-fF8Stst7BnrEKVQLP7og-HLp=T+NNoiSpUmRD3mwxXtK67Q@mail.gmail.com>
 <20f59230-59fa-9946-3b4f-937cd1bf619a@sernet.de>
In-Reply-To: <20f59230-59fa-9946-3b4f-937cd1bf619a@sernet.de>
Date: Mon, 22 Jun 2020 10:42:53 +0200
Message-ID: <CAC-fF8SPmfGbokEzBjZW9zBqbDYeTUg8YN8i_cWY-UN3th1QPA@mail.gmail.com>
Subject: Re: gitlab: testing of ldap-ssl-ads option
To: =?UTF-8?Q?Bj=C3=B6rn_Baumbach?= <bb@sernet.de>
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Bj=C3=B6rn

On Mon, Jun 22, 2020 at 10:30 AM Bj=C3=B6rn Baumbach <bb@sernet.de> wrote:
>
> On 6/19/20 11:57 PM, Isaac Boukris via samba-technical wrote:
> > On Fri, Jun 19, 2020 at 9:01 PM Isaac Boukris <iboukris@gmail.com> wrot=
e:
> >>
> >> On Fri, Jun 19, 2020 at 8:20 PM Jeremy Allison <jra@samba.org> wrote:
> >>>
> >>> On Fri, Jun 19, 2020 at 07:45:28PM +0200, Isaac Boukris via samba-tec=
hnical wrote:
> >>>
> >>>> Does anyone have any idea on this error and why I only get it on git=
lab?
> >>>
> >>> My guess would be differing gnutls library
> >>> versions. Not sure how to determine what
> >>> gnutls library version is on gitlab.
> >>
> >> In the raw log I now see the host was "Ubuntu 18.04.4", i'll try that.
> >
> > My bad, it was rather easy to reproduce, it only worked in my lab
> > because I have 'TLS_REQCERT=3Dallow' in ldap.conf.
>
> For testing purposes I typically specify the ca cert the following way:
>
> LDAPTLS_CACERT=3D/var/lib/samba/private/tls/ca.crt ldapsearch -H ...

Yeah, that was my last attempt in MR 1402 for the ad_dc_ntvfs env (per
some comment, fl2008r2dc uses a self-signed cert), that looks like
working in my lab by not on gitlab yet.

btw, my assumption was that the smb.conf would be taken into effect
for the openldap calls, but it seems not - i need to test more
however.

$ cat st/client/client.conf |grep tls
tls cafile =3D /home/admin/git/samba/selftest/manage-ca/CA-samba.example.co=
m/Public/CA-samba.example.com-cert.pem
tls crlfile =3D /home/admin/git/samba/selftest/manage-ca/CA-samba.example.c=
om/Public/CA-samba.example.com-crl.pem
tls verify peer =3D no_check

