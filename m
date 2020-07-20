Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 49992225E09
	for <lists+samba-technical@lfdr.de>; Mon, 20 Jul 2020 14:00:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=cmbF2LBdN+oAC1k+KwhYx6Chc7/7mwDzvEI9OsWtLLI=; b=lU/orsGuDy288xQUdnOd+A7DgQ
	d9+0VL2DWJg3tAN4NWRF022pjLYkV2CKozH8b01JJn1Mmd5tWdGCF4KZ20lYoXgwdMtVlwsifXzNr
	h2xSfjZrnEKR7N+zEngRs32CgpRXkfrQsB+DV//CQ6SFxOmvDSIBskK1u9iN84EiBFP4JIj1Nog8F
	2Fs1hAQ++R1pMlbSH5wsKhpnXSMhLHN37ABf7BJk5lcvtpOlkvFW7DDyY9CJct4DZYofFvJQvmmFm
	Qg2wax61fnDSTmof980Rgotw/jS4JRavaJSDacEK7nfSeOLOMRLNhPQrouP8tvuqYhanTDaqubvQ8
	xMTkMgNA==;
Received: from localhost ([::1]:45312 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jxUSZ-008owY-SC; Mon, 20 Jul 2020 11:59:55 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:34004) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jxUSR-008owQ-Ll
 for samba-technical@lists.samba.org; Mon, 20 Jul 2020 11:59:51 +0000
Received: by mail-ed1-x542.google.com with SMTP id a8so12580015edy.1
 for <samba-technical@lists.samba.org>; Mon, 20 Jul 2020 04:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GMeIzTYyd478aXpKSOHkxHlasxqf59hifCDMRUSUhrM=;
 b=FKRUKKo9cLj2j6JLSXiDUsjKFYWXG79YSfgpRP8vMOOC8G+Qu7jXdSFZfb63VfMpnd
 FG6P+7fM7UpvPZfuEidvnGRRlo8BpigfHAZxt7MOSGdEUUAnH5ouA952NdWYKqCOeA9E
 PCD2i3vDxlCJL/49Bwcb2jog89lsC0KkYw9/+eKZTSU86GIV54ITezFza0Mn476CR5qg
 //hNORkVFHWamcTxScM6q3wC3kLEgg3PhdxJqGju0o34sdJrFtVrA2z0sJDgBPB1Sbtr
 x5iSwZDZ4Hh7Ut/VKmL3RfinWCwqwTwgRY0JFUWYXF2GilWmkrnzqXXiFRHRFcM5hCKD
 CWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GMeIzTYyd478aXpKSOHkxHlasxqf59hifCDMRUSUhrM=;
 b=q1uWMCAj4jtAOrc7KKZSH9OgawhqKKxX7/HNUHqgW2cm69EJPQozRkeh077dUTrrJ2
 8GKRVxKMYovUZorY6zB30gytqymM+uiXz92W6rwcikWwDlGSgsBck5FBNfK2Pq1ARAsk
 hmaxROUfFmIUe8lVzkduZ6J79Rem70onSYBquzl3Ve5f8bkueLQOWqx6HsbizY09tFbE
 YiDaGeo4yTvjT0RvfkZuWgREan5l82w2t+sU147YTxbVaH1BSsVg45r2SFwBV49Gq1Ks
 vxdONr2S3UkjB8bY2zhhC062EvWxfb6ynMGE/5GVN3NkmQ8sV8pkzmmCpC/MyR/ymaFc
 BrxA==
X-Gm-Message-State: AOAM532XAz2MnC7A1ofTgVVQ++pX4hYiCErVe43lSglsnpim3ou8M4eB
 USW/QzKzKpm3mYmVkE+yJtuFdZFHd/LUH5fgCqLceEKqMgg=
X-Google-Smtp-Source: ABdhPJzp9SEmI17vVRflmL+kGMeUXL022lZqIz8y+RqLcElgKNLMMXN114XdAZ9I+WbWuEjFGR/x07AWKSvC9GhGKtg=
X-Received: by 2002:aa7:c4d1:: with SMTP id p17mr20443100edr.268.1595246382622; 
 Mon, 20 Jul 2020 04:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAH72RCWDx2Qsn3jo8_hAMC0m_8VwDHxxvg6JL8mwdEGR5TxN8w@mail.gmail.com>
 <20200720101347.GE25598@pinega.vda.li>
In-Reply-To: <20200720101347.GE25598@pinega.vda.li>
Date: Mon, 20 Jul 2020 14:54:03 +0300
Message-ID: <CAH72RCVORM_48QvCEKy4U=9BhwDrMTJDUjT+MA5vN0GDUfUbyA@mail.gmail.com>
Subject: Re: GSoC 2020 Progress Update
To: Alexander Bokovoy <ab@samba.org>
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
From: hezekiah maina via samba-technical <samba-technical@lists.samba.org>
Reply-To: hezekiah maina <hezekiahmaina3@gmail.com>
Cc: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>,
 "abartlet@samba.org" <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I did try the workaround given by openSUSE
https://en.opensuse.org/openSUSE:Packaging_nodejs#
but it seems I'm having a problem with the directory naming as
the po2json is actually included in the tarball and does not need to be
downloaded
through npm :
https://gitlab.com/HezekiahM/samba-ad-dc/-/blob/master/po/po2json
I removed the dependencies and devDependencies in this patch
https://build.opensuse.org/package/view_file/home:Hezekiah/samba-ad-dc/remo=
ve-node-dependency-tag.patch?expand=3D1
I will try to rename the directories and will let you know how it goes.

Thank you.

On Mon, Jul 20, 2020 at 1:13 PM Alexander Bokovoy <ab@samba.org> wrote:

> On su, 19 hein=C3=A4 2020, hezekiah maina wrote:
> > Over the past two weeks I have been working on the following:
> > Packaging for Debian and RPM-based distributions
> > Domain Management components
> > Delegation Management components
> > Service Principal Name management
> > UI improvements for the application
>
> Thank you, Hezekiah.
>
> I haven't tried to run the plugin yet but the changes look promising.
>
> I am still on vacation this week, only looked briefly into your OBS
> Fedora build failures. It looks like the failures happen because OBS
> tries to build the app by fetching all node.js from online sources and
> failing to do so, thus not finding required modules (po2json, for
> example).
>
> When I prebuilt source with 'make srpm' and tried to build that manually
> in COPR[1], it succeeded:
> https://copr.fedorainfracloud.org/coprs/abbra/cockpit-samba-ad-dc/build/1=
565160/
>
> So we need to find a way to pre-build sources and then build the
> packages. I'll look into that.
>
> [1] https://copr.fedorainfracloud.org/coprs/abbra/cockpit-samba-ad-dc/
>
>
> --
> / Alexander Bokovoy
>
