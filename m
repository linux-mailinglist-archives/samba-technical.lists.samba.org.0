Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1503B44DE5
	for <lists+samba-technical@lfdr.de>; Thu, 13 Jun 2019 22:57:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=CotwMGfktbV2JmW5BNFBwkCTE4st75W51MAHFLmmezo=; b=Q7CwkttmBYOlNtA0D3bzGkTLgz
	lW+3YvcjIxEcFbkSurcs+boR28hT6x30R68Idm6KZtDaqGoxPAY+xpS2DLjT+vc5iffvPgU8ncPe9
	nPzBlm8FuixpSMbMLOp9zhhCBii3Xc2Qn/o+th6kZwPtmvuqL9iB4+TD9wtI2hHoObJz8PVCMrP/h
	9tWLfrrosHhlGwUi2TiLv3erASdsYDGenS4NVPJQYNGNuDJLW0UXYnY4Cd3mzrj4s4ll1q9HSaW5M
	vyxWqTuG2EqANWRq20jhGO6Vq9mSRJDiORSmAsARg7LW5HHXFzPUlP/SFbitAnHuRQhKlLbXFfj3U
	oIzHezZA==;
Received: from localhost ([::1]:59798 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hbWld-00082X-7u; Thu, 13 Jun 2019 20:56:17 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:35120) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hbWlW-00082Q-RF
 for samba-technical@lists.samba.org; Thu, 13 Jun 2019 20:56:13 +0000
Received: by mail-pg1-x52f.google.com with SMTP id s27so199422pgl.2
 for <samba-technical@lists.samba.org>; Thu, 13 Jun 2019 13:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CotwMGfktbV2JmW5BNFBwkCTE4st75W51MAHFLmmezo=;
 b=o684yr0eF1J9l6Npd8jvaHRg6kKZlsQNHttvWxI6C5+LrA6H3WlQh4r+7mIalE0mnF
 czldBZpn3Haaantz9vFs5kG4ss6DX+cuxTFWwSNTr2dSjgpyCdrh223pPLPvC13c2B/2
 aTZ0nbBGkGCl+HJGG438JsCgzJheqFwwLaKKB5XDxCxyd+CQHc0h7ZaOfJ9K6fw6IMWs
 apEiQxZElv7sOiU3y4l43BN6YJ5bYj4Pwdzq6bDLNfTqAaMjATmgrPt0WSk6VHaBY/sx
 12bPT0k7QjuV4tkYf/f6ksOr4a4jq+16kxiW+EPXRvaCqc0FCt8tL9KYX2b0UJrUMoJu
 n7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CotwMGfktbV2JmW5BNFBwkCTE4st75W51MAHFLmmezo=;
 b=scGwLoQFxBiWc/GP0PgQfMCOe6CcIAYIenKFwZgCgvl0YE7UDu75S5a5czqzBF//1J
 viSoVLccgNJnWF1uNrOeM628ULrdYdwPy4iQaZUhgGhhTclY4BG7q0NQmBA0wqIf6JsS
 Thw2lV4iONV/DjaplfP0TSpcXX294bgZFd4WW8c8DgznGzIAURoqsZ8njWRVM/hNiNgP
 RTS0xE/5w9GOZtNIPMlpEc1T3RFTf3dBZdSr7X0Hhn2+lss8ArSj+U8js/GiP+RUv9tQ
 7ULWmCU2OI/L120lmgtxue5zTq0NiHH7QZ7aM1sn3d2s8Z1JoN9KSfKEdNd8zSiDq32E
 pdtg==
X-Gm-Message-State: APjAAAVxRzY8YWyhtjYBCC9FR6fnJt68lgY4siWHp6BQsaoN8REeLBeZ
 qg/233GKygmhpvxJA2BvvynT2NkD+pd5FFzhvNk=
X-Google-Smtp-Source: APXvYqwO/Qkgrz7jehIL1QPW18MDyIPJHlhhZ4RjpYpe9GLGC0RKH8rwhYrF0HNjdEl8CQI2SIQ7cmsi2XR6tAPttG8=
X-Received: by 2002:a63:8b4c:: with SMTP id j73mr20707055pge.15.1560459368507; 
 Thu, 13 Jun 2019 13:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <CALe0_75rQHY5em=YEvT-K64uOnWzAeg8p=ZZtH1WhEFzk4nNmg@mail.gmail.com>
 <CAH2r5muMo6LCEW1fTP4bGtf7aXggzs_YthRdB=qYnPg5EUEsJQ@mail.gmail.com>
 <20190123003029.GA235078@jra3> <20190124110829.GC20089@sernet.de>
 <20190124170341.GA104839@jra3> <20190124170945.wsasncusduwg3zbp@kazak>
 <CALe0_75-64OXgeWb6kQu6R1bA2OM9shJ=YQvbPnm6EJ_zHjbiQ@mail.gmail.com>
 <20190124201433.bibu3k2fo7h2bdep@kazak>
 <CALe0_74ZEDEafvyWqWqCD74TBO5Pyq=G=jb0AMcCmAwmP0OZYQ@mail.gmail.com>
 <20190124224927.GB252624@jra3>
 <CALe0_76rHGUedvRHvEyYvROPp8fPtvM9unkw7-gsLG2CPYxasw@mail.gmail.com>
In-Reply-To: <CALe0_76rHGUedvRHvEyYvROPp8fPtvM9unkw7-gsLG2CPYxasw@mail.gmail.com>
Date: Thu, 13 Jun 2019 15:55:57 -0500
Message-ID: <CAH2r5ms36rp_5c4VaKFOSLEWGNEYXtt2h_HCdLJjhrDXVEnHTw@mail.gmail.com>
Subject: Re: Fwd: SMB2 not respecting mtime values
To: Jacob Shivers <jshivers@redhat.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I verified that Jacob is correct.   Works (mtime preserved) to Windows
10 server, but fails to Samba 4.10 server (mtime not preserved after
being set).

On Wed, Jun 12, 2019 at 11:19 AM Jacob Shivers <jshivers@redhat.com> wrote:
>
> I finally got around to making some time for this and I this is indeed
> a server side issue.
> The SMB client is using the appropriate file handles when setting
> atime and mtime and the server initially reports the desired mtime.
> The server only slightly later reports a mtime matching that of ctime.
>
> $ tshark -tad -n -r cp_p-testing-3.16.66.pcap -Y 'smb2.pid =3D=3D 0xf2d'
> -T fields -e frame.number -e smb2.fid -e smb2.last_access.time -e
> smb2.last_write.time -e _ws.col.Info -E header=3Dy | tr '\t' '#' |
> column -t -s '#'
> frame.number  smb2.fid
> smb2.last_access.time                smb2.last_write.time
>    _ws.col.Info
> 170
>                                                        Create Request
> File: test_file-data
> 171
>                                                        Create
> Response, Error: STATUS_OBJECT_NAME_NOT_FOUND
> 173           00000000-0000-0000-0000-000000000000
>                                                        Create Request
> File: test_file-data
> 174           5981ad82-0000-0000-1d86-2dcf00000000  May 27, 2019
> 20:16:03.862513400 EDT  May 27, 2019 20:16:03.862513400 EDT  Create
> Response File: test_file-data
> 175           5981ad82-0000-0000-1d86-2dcf00000000
>                                                        GetInfo Request
> FILE_INFO/SMB2_FILE_INTERNAL_INFO File: test_file-data
> 176
>                                                        GetInfo
> Response
> 177           5981ad82-0000-0000-1d86-2dcf00000000
>                                                        Write Request
> Len:12 Off:0 File: test_file-data
> 178
>                                                        Write Response
> 179
>                                                        Create Request
> File: test_file-data
> 180           b8fa5b2d-0000-0000-d86e-38bf00000000  May 27, 2019
> 20:16:03.862513400 EDT  May 27, 2019 20:16:03.862513400 EDT  Create
> Response File: test_file-data
> 181           b8fa5b2d-0000-0000-d86e-38bf00000000  Oct 31, 2018
> 00:00:00.000000000 EDT  Oct 31, 2018 00:00:00.000000000 EDT  SetInfo
> Request FILE_INFO/SMB2_FILE_BASIC_INFO File: test_file-data
> 182
>                                                        SetInfo
> Response
> 183           b8fa5b2d-0000-0000-d86e-38bf00000000
>                                                        Close Request
> File: test_file-data
> 184                                                 Dec 31, 1969
> 19:00:00.000000000 EST  Dec 31, 1969 19:00:00.000000000 EST  Close
> Response
> 185
>                                                        Create Request
> File: test_file-data
> 186           f7323833-0000-0000-5d04-6e1d00000000  Oct 31, 2018
> 00:00:00.000000000 EDT  Oct 31, 2018 00:00:00.000000000 EDT  Create
> Response File: test_file-data
> 187           f7323833-0000-0000-5d04-6e1d00000000  Dec 31, 1969
> 19:00:00.000000000 EST  Dec 31, 1969 19:00:00.000000000 EST  SetInfo
> Request FILE_INFO/SMB2_FILE_BASIC_INFO File: test_file-data
> 188
>                                                        SetInfo
> Response
> 189           f7323833-0000-0000-5d04-6e1d00000000
>                                                        Close Request
> File: test_file-data
> 190                                                 Dec 31, 1969
> 19:00:00.000000000 EST  Dec 31, 1969 19:00:00.000000000 EST  Close
> Response
> 191           5981ad82-0000-0000-1d86-2dcf00000000
>                                                        Close Request
> File: test_file-data
> 192                                                 Dec 31, 1969
> 19:00:00.000000000 EST  Dec 31, 1969 19:00:00.000000000 EST  Close
> Response
>
>
> $ tshark -tad -n -r cp_p-testing-3.16.66.pcap -Y 'smb2.cmd =3D=3D find' -=
O
> smb2 | sed '/test_file-data/,/test_file-data/ !d'
>             FileIdBothDirectoryInfo: test_file-data
>                 Next Offset: 0
>                 File Index: 0x00000000
>                 Create: May 27, 2019 20:16:03.862513400 EDT
>                 Last Access: Oct 31, 2018 00:00:00.000000000 EDT
>                 Last Write: May 27, 2019 20:16:03.872393500 EDT
>                 Last Change: May 27, 2019 20:16:03.872393500 EDT
>                 End Of File: 12
>                 Allocation Size: 1048576
>                 File Attributes: 0x00000020
>                     .... .... .... .... .... .... .... ...0 =3D Read
> Only: NOT read only
>                     .... .... .... .... .... .... .... ..0. =3D Hidden: N=
OT hidden
>                     .... .... .... .... .... .... .... .0.. =3D System:
> NOT a system file/dir
>                     .... .... .... .... .... .... .... 0... =3D Volume
> ID: NOT a volume ID
>                     .... .... .... .... .... .... ...0 .... =3D
> Directory: NOT a directory
>                     .... .... .... .... .... .... ..1. .... =3D Archive:
> Modified since last ARCHIVE
>                     .... .... .... .... .... .... .0.. .... =3D Device:
> NOT a device
>                     .... .... .... .... .... .... 0... .... =3D Normal:
> Has some attribute set
>                     .... .... .... .... .... ...0 .... .... =3D
> Temporary: NOT a temporary file
>                     .... .... .... .... .... ..0. .... .... =3D Sparse:
> NOT a sparse file
>                     .... .... .... .... .... .0.. .... .... =3D Reparse
> Point: Does NOT have an associated reparse point
>                     .... .... .... .... .... 0... .... .... =3D
> Compressed: Uncompressed
>                     .... .... .... .... ...0 .... .... .... =3D Offline: =
Online
>                     .... .... .... .... ..0. .... .... .... =3D Content
> Indexed: NOT content indexed
>                     .... .... .... .... .0.. .... .... .... =3D
> Encrypted: This is NOT an encrypted file
>                 Filename Length: 28
>                 EA Size: 60
>                 Reserved: 00000000
>                 File Id: 0x0000000000052b02
>                 Filename: test_file-data
>
> I've added additional notes, strace, and pcap data to both kenel and
> samba bugzillas that seem applicable to this:
>
>   ** Bug 198967 - Modification times not preserved correctly **
>   https://bugzilla.kernel.org/show_bug.cgi?id=3D198967
>
>   ** Bug 13594 - smbd write time handling differs compared to recent
> Windows releases **
>   https://bugzilla.samba.org/show_bug.cgi?id=3D13594
>
> The earlier comments about filehandle do not apply as the atime used
> the same filehandle and the filehandle used is what should be used for
> compound operations.
>
> For context, Samba is matching behavior in Windows 2k16.
>
>
> On Thu, Jan 24, 2019 at 5:49 PM Jeremy Allison <jra@samba.org> wrote:
> >
> > On Thu, Jan 24, 2019 at 05:47:24PM -0500, Jacob Shivers wrote:
> > > On Thu, Jan 24, 2019 at 3:14 PM Ralph B=C3=B6hme <slow@samba.org> wro=
te:
> > > >
> > > > On Thu, Jan 24, 2019 at 12:24:53PM -0500, Jacob Shivers wrote:
> > > > >On Thu, Jan 24, 2019 at 12:11 PM Ralph B=C3=B6hme via samba-techni=
cal
> > > > ><samba-technical@lists.samba.org> wrote:
> > > > >>
> > > > >> On Thu, Jan 24, 2019 at 09:03:41AM -0800, Jeremy Allison via sam=
ba-technical wrote:
> > > > >> >Maybe. Changing meta-data semantics on write is fraught with da=
nger,
> > > > >> >and we don't even do that for SMB1 unix extensions. So let's no=
t
> > > > >> >add contraints we don't understand yet please.
> > > > >> >
> > > > >> >My money is on a client bug, as always :-).
> > > > >>
> > > > >> fwiw, just in case you were not aware of this one:
> > > > >>
> > > > >> https://bugzilla.samba.org/show_bug.cgi?id=3D13594
> > > > >>
> > > > >> We also seem to have a bug that a set-eof on a handle with
> > > > >> set-eof-size=3Dexisting-size doesn't flush a pending write time =
update. At least
> > > > >> newer Windows server seem to do that.
> > > > >
> > > > >This seems like what the issue is.
> > > > >The SMB server is uptime mtime after the server actually flushes t=
o
> > > > >stable storage.
> > > >
> > > > not quite, but still a client bug. :) The client uses a second hand=
le to set the
> > > > mtime, it should use the first handle. Or open the second handle af=
ter closing
> > > > the first one where it did the write.
> > >
> > > Ahh.
> > >
> > > Thank you very much for your help and for narrowing down the problem
> > > to a client side bug :)
> >
> > Bingo ! I claim my 5 euro :-) :-).



--=20
Thanks,

Steve

