Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FAC47170
	for <lists+samba-technical@lfdr.de>; Sat, 15 Jun 2019 19:39:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=VPSGeapLbblMTfU7JbBrVgKQtg994svKjx4xrjIvlUo=; b=rIYRVeQZw75yEss9q7hb+PN627
	817teUiD+SggVbr/YOHtinXxg3Fcwf5IHMdGZ81SJkbPycok81jEKpt3eDQUi57KyRRg8UTH33VFl
	rLcdZKYm3wJ2FibHrtTfXi5aHeCYwgkLODi8mW0Qki6yb1BNTB8TKGnaYOTvWhRf7YBxABpoW71p5
	2yGFnTL/Ze0MwRMKfSoIuRaux3T008ML7n/O4ZAQem5tEoJKHlcsEcJ71ZPTcFysRUnJQEU8FSXLa
	xjN3eG6zoIvh6aUEHb9TYZY4Vfk0I45r5ypPv5vtmye4d55xW82XhP/JrDoRmqbUuvhXTkwVVwJWl
	1RwQ9QqQ==;
Received: from localhost ([::1]:51588 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hcCdQ-000YPf-OC; Sat, 15 Jun 2019 17:38:36 +0000
Received: from mail-pg1-f173.google.com ([209.85.215.173]:34663) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hcCdH-000YPY-4C
 for samba-technical@lists.samba.org; Sat, 15 Jun 2019 17:38:33 +0000
Received: by mail-pg1-f173.google.com with SMTP id p10so3412844pgn.1
 for <samba-technical@lists.samba.org>; Sat, 15 Jun 2019 10:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VPSGeapLbblMTfU7JbBrVgKQtg994svKjx4xrjIvlUo=;
 b=c/zPOrn/vStwRzZiDXx/Z/MhlQhuFKJo8C1HHqzW6Ep2CmGF4rFaEbAAjjSSRr4z3R
 shuIh/a9fzVePXe/rqRWOH1iQIiIxYsE47fXbz6xf4LaE0K/SamCe780PkPJ3F4j9AVy
 Bm7KHwVICiZx/oQ4dlftqW1raWW7f6j0y3Av7cRb1646fw67MA5+/xtxFTABlU2SoswE
 a4UNYItBXt/3PRFvA47QSlU+m1aZrmYR+r1UXN4paf+rICR2ZLSqNI8GfZ3sRnMj8L/5
 7fiYiJxEro/FyV4ViHJNK6k51LBvvPjcgM2rCn2uvTsfFt27mj6bx6jo/qPcDVhy5sK9
 VANQ==
X-Gm-Message-State: APjAAAVKLwNjoqJ/8/XBXUprjpY5+5TLkk/3xDD4fGKYu5Uvy4dx58NU
 e6IGm4qbZDvDMmAaOtlyirnVUAlH3tMCTJThdNVokQ==
X-Google-Smtp-Source: APXvYqyOW59FRhIJxsnBhHDiAAJz6lb++uHNrV25iUcRFf7B69NVVRAJciPvvVOroIdPRSarbchPHZemhfuosW0m6k8=
X-Received: by 2002:a17:90a:ca11:: with SMTP id
 x17mr17484391pjt.107.1560620304511; 
 Sat, 15 Jun 2019 10:38:24 -0700 (PDT)
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
 <CAH2r5ms36rp_5c4VaKFOSLEWGNEYXtt2h_HCdLJjhrDXVEnHTw@mail.gmail.com>
In-Reply-To: <CAH2r5ms36rp_5c4VaKFOSLEWGNEYXtt2h_HCdLJjhrDXVEnHTw@mail.gmail.com>
Date: Sat, 15 Jun 2019 13:37:48 -0400
Message-ID: <CALe0_74P7HgKPseZommk7u9ixMfQA-cAid1EYDymfC0TLaDBQg@mail.gmail.com>
Subject: Re: Fwd: SMB2 not respecting mtime values
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
From: Jacob Shivers via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jacob Shivers <jshivers@redhat.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Also confirming that mtime is preserved when copying to a Windows 2k19 serv=
er.
Windows OS pre 2k16 and 10 are impacted and Samba is impacted.

On Thu, Jun 13, 2019 at 4:56 PM Steve French <smfrench@gmail.com> wrote:
>
> I verified that Jacob is correct.   Works (mtime preserved) to Windows
> 10 server, but fails to Samba 4.10 server (mtime not preserved after
> being set).
>
> On Wed, Jun 12, 2019 at 11:19 AM Jacob Shivers <jshivers@redhat.com> wrot=
e:
> >
> > I finally got around to making some time for this and I this is indeed
> > a server side issue.
> > The SMB client is using the appropriate file handles when setting
> > atime and mtime and the server initially reports the desired mtime.
> > The server only slightly later reports a mtime matching that of ctime.
> >
> > $ tshark -tad -n -r cp_p-testing-3.16.66.pcap -Y 'smb2.pid =3D=3D 0xf2d=
'
> > -T fields -e frame.number -e smb2.fid -e smb2.last_access.time -e
> > smb2.last_write.time -e _ws.col.Info -E header=3Dy | tr '\t' '#' |
> > column -t -s '#'
> > frame.number  smb2.fid
> > smb2.last_access.time                smb2.last_write.time
> >    _ws.col.Info
> > 170
> >                                                        Create Request
> > File: test_file-data
> > 171
> >                                                        Create
> > Response, Error: STATUS_OBJECT_NAME_NOT_FOUND
> > 173           00000000-0000-0000-0000-000000000000
> >                                                        Create Request
> > File: test_file-data
> > 174           5981ad82-0000-0000-1d86-2dcf00000000  May 27, 2019
> > 20:16:03.862513400 EDT  May 27, 2019 20:16:03.862513400 EDT  Create
> > Response File: test_file-data
> > 175           5981ad82-0000-0000-1d86-2dcf00000000
> >                                                        GetInfo Request
> > FILE_INFO/SMB2_FILE_INTERNAL_INFO File: test_file-data
> > 176
> >                                                        GetInfo
> > Response
> > 177           5981ad82-0000-0000-1d86-2dcf00000000
> >                                                        Write Request
> > Len:12 Off:0 File: test_file-data
> > 178
> >                                                        Write Response
> > 179
> >                                                        Create Request
> > File: test_file-data
> > 180           b8fa5b2d-0000-0000-d86e-38bf00000000  May 27, 2019
> > 20:16:03.862513400 EDT  May 27, 2019 20:16:03.862513400 EDT  Create
> > Response File: test_file-data
> > 181           b8fa5b2d-0000-0000-d86e-38bf00000000  Oct 31, 2018
> > 00:00:00.000000000 EDT  Oct 31, 2018 00:00:00.000000000 EDT  SetInfo
> > Request FILE_INFO/SMB2_FILE_BASIC_INFO File: test_file-data
> > 182
> >                                                        SetInfo
> > Response
> > 183           b8fa5b2d-0000-0000-d86e-38bf00000000
> >                                                        Close Request
> > File: test_file-data
> > 184                                                 Dec 31, 1969
> > 19:00:00.000000000 EST  Dec 31, 1969 19:00:00.000000000 EST  Close
> > Response
> > 185
> >                                                        Create Request
> > File: test_file-data
> > 186           f7323833-0000-0000-5d04-6e1d00000000  Oct 31, 2018
> > 00:00:00.000000000 EDT  Oct 31, 2018 00:00:00.000000000 EDT  Create
> > Response File: test_file-data
> > 187           f7323833-0000-0000-5d04-6e1d00000000  Dec 31, 1969
> > 19:00:00.000000000 EST  Dec 31, 1969 19:00:00.000000000 EST  SetInfo
> > Request FILE_INFO/SMB2_FILE_BASIC_INFO File: test_file-data
> > 188
> >                                                        SetInfo
> > Response
> > 189           f7323833-0000-0000-5d04-6e1d00000000
> >                                                        Close Request
> > File: test_file-data
> > 190                                                 Dec 31, 1969
> > 19:00:00.000000000 EST  Dec 31, 1969 19:00:00.000000000 EST  Close
> > Response
> > 191           5981ad82-0000-0000-1d86-2dcf00000000
> >                                                        Close Request
> > File: test_file-data
> > 192                                                 Dec 31, 1969
> > 19:00:00.000000000 EST  Dec 31, 1969 19:00:00.000000000 EST  Close
> > Response
> >
> >
> > $ tshark -tad -n -r cp_p-testing-3.16.66.pcap -Y 'smb2.cmd =3D=3D find'=
 -O
> > smb2 | sed '/test_file-data/,/test_file-data/ !d'
> >             FileIdBothDirectoryInfo: test_file-data
> >                 Next Offset: 0
> >                 File Index: 0x00000000
> >                 Create: May 27, 2019 20:16:03.862513400 EDT
> >                 Last Access: Oct 31, 2018 00:00:00.000000000 EDT
> >                 Last Write: May 27, 2019 20:16:03.872393500 EDT
> >                 Last Change: May 27, 2019 20:16:03.872393500 EDT
> >                 End Of File: 12
> >                 Allocation Size: 1048576
> >                 File Attributes: 0x00000020
> >                     .... .... .... .... .... .... .... ...0 =3D Read
> > Only: NOT read only
> >                     .... .... .... .... .... .... .... ..0. =3D Hidden:=
 NOT hidden
> >                     .... .... .... .... .... .... .... .0.. =3D System:
> > NOT a system file/dir
> >                     .... .... .... .... .... .... .... 0... =3D Volume
> > ID: NOT a volume ID
> >                     .... .... .... .... .... .... ...0 .... =3D
> > Directory: NOT a directory
> >                     .... .... .... .... .... .... ..1. .... =3D Archive=
:
> > Modified since last ARCHIVE
> >                     .... .... .... .... .... .... .0.. .... =3D Device:
> > NOT a device
> >                     .... .... .... .... .... .... 0... .... =3D Normal:
> > Has some attribute set
> >                     .... .... .... .... .... ...0 .... .... =3D
> > Temporary: NOT a temporary file
> >                     .... .... .... .... .... ..0. .... .... =3D Sparse:
> > NOT a sparse file
> >                     .... .... .... .... .... .0.. .... .... =3D Reparse
> > Point: Does NOT have an associated reparse point
> >                     .... .... .... .... .... 0... .... .... =3D
> > Compressed: Uncompressed
> >                     .... .... .... .... ...0 .... .... .... =3D Offline=
: Online
> >                     .... .... .... .... ..0. .... .... .... =3D Content
> > Indexed: NOT content indexed
> >                     .... .... .... .... .0.. .... .... .... =3D
> > Encrypted: This is NOT an encrypted file
> >                 Filename Length: 28
> >                 EA Size: 60
> >                 Reserved: 00000000
> >                 File Id: 0x0000000000052b02
> >                 Filename: test_file-data
> >
> > I've added additional notes, strace, and pcap data to both kenel and
> > samba bugzillas that seem applicable to this:
> >
> >   ** Bug 198967 - Modification times not preserved correctly **
> >   https://bugzilla.kernel.org/show_bug.cgi?id=3D198967
> >
> >   ** Bug 13594 - smbd write time handling differs compared to recent
> > Windows releases **
> >   https://bugzilla.samba.org/show_bug.cgi?id=3D13594
> >
> > The earlier comments about filehandle do not apply as the atime used
> > the same filehandle and the filehandle used is what should be used for
> > compound operations.
> >
> > For context, Samba is matching behavior in Windows 2k16.
> >
> >
> > On Thu, Jan 24, 2019 at 5:49 PM Jeremy Allison <jra@samba.org> wrote:
> > >
> > > On Thu, Jan 24, 2019 at 05:47:24PM -0500, Jacob Shivers wrote:
> > > > On Thu, Jan 24, 2019 at 3:14 PM Ralph B=C3=B6hme <slow@samba.org> w=
rote:
> > > > >
> > > > > On Thu, Jan 24, 2019 at 12:24:53PM -0500, Jacob Shivers wrote:
> > > > > >On Thu, Jan 24, 2019 at 12:11 PM Ralph B=C3=B6hme via samba-tech=
nical
> > > > > ><samba-technical@lists.samba.org> wrote:
> > > > > >>
> > > > > >> On Thu, Jan 24, 2019 at 09:03:41AM -0800, Jeremy Allison via s=
amba-technical wrote:
> > > > > >> >Maybe. Changing meta-data semantics on write is fraught with =
danger,
> > > > > >> >and we don't even do that for SMB1 unix extensions. So let's =
not
> > > > > >> >add contraints we don't understand yet please.
> > > > > >> >
> > > > > >> >My money is on a client bug, as always :-).
> > > > > >>
> > > > > >> fwiw, just in case you were not aware of this one:
> > > > > >>
> > > > > >> https://bugzilla.samba.org/show_bug.cgi?id=3D13594
> > > > > >>
> > > > > >> We also seem to have a bug that a set-eof on a handle with
> > > > > >> set-eof-size=3Dexisting-size doesn't flush a pending write tim=
e update. At least
> > > > > >> newer Windows server seem to do that.
> > > > > >
> > > > > >This seems like what the issue is.
> > > > > >The SMB server is uptime mtime after the server actually flushes=
 to
> > > > > >stable storage.
> > > > >
> > > > > not quite, but still a client bug. :) The client uses a second ha=
ndle to set the
> > > > > mtime, it should use the first handle. Or open the second handle =
after closing
> > > > > the first one where it did the write.
> > > >
> > > > Ahh.
> > > >
> > > > Thank you very much for your help and for narrowing down the proble=
m
> > > > to a client side bug :)
> > >
> > > Bingo ! I claim my 5 euro :-) :-).
>
>
>
> --
> Thanks,
>
> Steve

