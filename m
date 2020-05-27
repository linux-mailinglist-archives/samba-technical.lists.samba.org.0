Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D20091E51F6
	for <lists+samba-technical@lfdr.de>; Thu, 28 May 2020 01:45:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=+ZzoniwVqDZIcF5R0Ju2Vi535qFzsZpFnN/dHboBL+Q=; b=pOFlo7nOBP6Zuc9xxdK+78uAI6
	aIb46yuYU9Uh7PG7+vn4AR14DRBa4mOCB7CizpAwEtf1D7heHhKwOFMLmvpepqf7PtC6gqlfFbf1+
	Ul2pVhKGacwXOmZJDr1WnGw0YTG5UGUjXMxOd1hWefNpxerME8RNUTYW5OMPJ0B20ALVwopuSA9iS
	RtxNNAa+98IFdubLxjqfhmOnZ13SdCcLiRnohZOkvOtZTihlvAY4FgK3w2gtLUKvZ3rWjpJH2U4yX
	bxnvRUDUdtK3bbmvICBf7upmtYVrgP3vKdpWEpTvvLkhi6kLY+aVHfwTumKs2WaMefIWBNHa05iqs
	9+RMOfsQ==;
Received: from localhost ([::1]:28176 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1je5ji-0066sx-8y; Wed, 27 May 2020 23:45:26 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:32855) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1je5ja-0066sq-MA
 for samba-technical@lists.samba.org; Wed, 27 May 2020 23:45:23 +0000
Received: by mail-ot1-x333.google.com with SMTP id v17so1050052ote.0
 for <samba-technical@lists.samba.org>; Wed, 27 May 2020 16:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eDXbowTTCxhzY2qRnCO0f14IDXtSYBV195lXar7YMB0=;
 b=USNHnCKcwLRet4W7gzVTrfDwUN41/wQODLUnfgK13BX6vOMZ2TO705SKKFo7FPUdHr
 Bn5iDPC2Ah1K5UJD5KHiXvhCTTCyb7u39vXVNSX3zre9JRibRho2thJA/vc7GYEFYdzX
 7i67vPzRyhWyua7/FAs1fBDrH8bfYTdTs9gk0ZIzSwUg545xnuFar23KI5I8q6+VehwZ
 XzdIkg8NXqnpq8k8TLnb1RHGIh75wpDDBxViMvUCW6wHpuJNt/hFwztTvmlN/q8eiMlT
 Pre1h8iZBrZBwLwenZVatFaY9ly/CAPyHEqvqUjrDwvJLz81I7PB46eD2xYK+Kefwick
 KeRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eDXbowTTCxhzY2qRnCO0f14IDXtSYBV195lXar7YMB0=;
 b=IGTrchkyD8UsP7vv5M+o8V4j05mRxfc24ALtwsohQcWhDtMCI1qMUQfm2xKECklsNo
 Ww0BY60GOtbQ/0InqDgXBqtaLb9j7usYN3V6RCD0o7/hKaM4x+NcNewqPCJng2sKkgVP
 TQyB1NLByRf3xfoJpMViOF86eYNAJepvg4yu//xOddUP7zIwOGT9NyJ9UbrLtmhvRZ8J
 FAUWX0vR07h1sifEjpUSUL38av1iUZPfEZ+cOC/SgeZnPBMozYUtnUnitXkYB5ATvAe5
 DLnD9oV4+AsW92W8vY0BzmfTGsuanqWSjRofuJsqBvyBHKCtnWDM+FI3flUhgo6CuSUI
 gSFA==
X-Gm-Message-State: AOAM5315Iquj1K8AVRrkeqfj0lkiW0wq/SUk9R4cn2ABfNThsExAVZhq
 rWLxx7XknTmzs1jw0FBEdxFsm4PrCrxoWSV+JCkEmA==
X-Google-Smtp-Source: ABdhPJywvKCDx9Q+BND25lYadUKY/cTtHCiHdYHQTmapACc+l46aQUkkCAmAUbrid+RVBwUTsxr+cgVBzoWw4/JBStE=
X-Received: by 2002:a9d:3608:: with SMTP id w8mr427856otb.318.1590623115834;
 Wed, 27 May 2020 16:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <4D14BB46-74F3-4EB7-A3F4-0C290A464D16@contoso.com>
 <beb6a045-722d-fe0d-e41d-ab7a25fbc5fb@samba.org>
 <CD19BF6F-5055-4697-A1BD-C8FF6948FD51@storagecraft.com>
In-Reply-To: <CD19BF6F-5055-4697-A1BD-C8FF6948FD51@storagecraft.com>
Date: Wed, 27 May 2020 19:46:35 -0400
Message-ID: <CAB5c7xquGEb=k_d5uJ5zvQKOfVA7QC4eHNDkgUiCzfG91YQ8ug@mail.gmail.com>
Subject: Re: Samba user quota implementation question
To: Krishna Harathi <krishna.harathi@storagecraft.com>
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Depending on the situation, you may need "winbind enum users =3D yes" and
"winbind enum groups =3D yes" in your smb.conf for AD user quotas to be
enumerated. It might be nice to have some mechanism to override the default
user quota enumeration method in Samba. For example "zfs userspace
<dataset>" and "zfs groupspace <dataset>" will enumerate user / group
quotas on a given dataset (and the equivalent can be obtained (though not
trivially easily) through libzfs.

Andrew

On Wed, May 27, 2020 at 6:17 PM Krishna Harathi via samba-technical <
samba-technical@lists.samba.org> wrote:

> On the contrary; normally, there is no passwd entry made for a AD user in
> the local password file.
>
> The set user-quota (for a user user-quota was not set before) is working
> fine as intended without any manual addition to local password file.
>
> I have to manually add the uid/gid entry of the SID/GID of the user
> authenticated/authorized by AD,  in order for the windows client to
> list/show the user that has user-quota already set.
>
> My question is - is it expected to find the subset of AD users with
> user-quota set in the local password file ?
> I am trying to figure out if there is any other way to accomplish windows
> client listing existing quota without this manual intervention.
> But if this is expected, I will find a way to make those entries in the
> local password file when a quota for a new user is set.
>
> Hope this explanation helps to describe the problem more. I will post the
> actual smb.conf file asap (not available at this moment). We have the "ge=
t
> quota command" and "set quota command" values and AD server with idmap
> "backend =3D autorid" and range configured.
>
> Regards.
> Krishna Harathi
>
>
> =EF=BB=BFOn 5/27/20, 12:53 PM, "samba-technical on behalf of Rowland penn=
y via
> samba-technical" <samba-technical-bounces@lists.samba.org on behalf of
> samba-technical@lists.samba.org> wrote:
>
>     ***EXTERNAL SENDER. Only open links and attachments from known
> senders. DO NOT provide your username or password.***
>
>     On 27/05/2020 20:42, Krishna Harathi via samba-technical wrote:
>     > Our OneXafe FS  supports share/fs level quota using smb.conf =E2=80=
=9Cset
> quota command=E2=80=9D and =E2=80=9Cget quota command=E2=80=9D.
>     >
>     > We are currently extending support to user-level quotas using the
> same interface, when Samba smbd is an AD DC member.
>     >
>     > Setting user quota from a windows client is working as expected. Bu=
t
> once quota is set, none of the users are listed in the quota=E2=80=99s po=
p-up
> window, so cannot delete or modify quota properties. Moreover, creating a
> new quota entry for the same user is generating a =E2=80=9Cquota entry al=
ready
> exists for this user=E2=80=9D error.
>     >
>     > By tracing get/set requests to our file server, I see that our FS
> server is receiving a get request for Samba for every user entry in the
> local password file, but none for the UID of the DC member user. But I do
> see a default quota get request for the group GID.
>     >
>     > The problem seems to be that the get/set command interface does not
> obviously support a =E2=80=9Clist=E2=80=9D user quota api to the hosting =
FS.
>     >
>     > Questions on this =E2=80=93  We can post and manage user entry (hos=
t-local
> uid/gid) corresponding to the DC user sid/gid whenever a =E2=80=9Cset use=
r quota=E2=80=9D
> is received. I did verify that when an entry is made manually, windows us=
er
> quota workflow behaves as expected. Is the problem assumption correct and
> is this a way to implement? Is there a better way, given the constraints?
>     >
>     > We are using Samba 4.7.11 patched with
> https://nam03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugzi=
lla.samba.org%2Fshow_bug.cgi%3Fid%3D13553%23c17&amp;data=3D01%7C01%7Ckrishn=
a.harathi%40storagecraft.com%7Cb00f68c028324ea5ece308d80277a7c3%7C99f4e3c9b=
ed5443dbd532b3f22d4eddf%7C0&amp;sdata=3DT6FbBy04TqSxJ%2FFx%2BZ3nVF29h%2BoHd=
NEqqIwuZXzm0hY%3D&amp;reserved=3D0
> fix for 4.7.
>     >
>     > Any help is this issue is much appreciated in advance.
>     >
>     > Regards.
>     > Krishna Harathi
>
>      From reading the above, it looks like you are saying that you have t=
he
>     same users in /etc/passwd and AD, is this correct ?
>
>     Can you also please post the entire smb.conf you are using on the
> OneXafe.
>
>     Rowland
>
>
>
>
>
