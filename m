Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1414382765
	for <lists+samba-technical@lfdr.de>; Tue,  6 Aug 2019 00:12:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=avf0I3xDvtapHifqv/odAO+t6/BXw+LDG5CHHKSQoq4=; b=fOR0w2eCVKDekCRIjRVgSsz4o0
	UETLf1vTL49FFdmyJhMk/H3CvJO1MTeUxDdFf8lWxHAf+qGXjzK6LzMZQE3j+5yzuX8IyHZaV85n5
	AfSwjAoRrxIJ9knw7cpQE7nVox2pjFqwcuUT2ZZJmAlO8we5okM0BDt0nKb0aFYtcGr2BF2DURFhm
	Zfu5+lzUuXL8DBOEnrz3nuk3oQskyRLpsjJa1skY+XW2ybInNvlO6z+ELyZffyB5OTIf/kwhopr2R
	qoaiDEQrq0COA9xshF3XnLHQIkbwWj0+hSLRZCupBDg/v1ZgRaA9K6zKCuvS2noHDoC9/Mjsgey0u
	ZS3UFh6Q==;
Received: from localhost ([::1]:25682 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hulCU-004Lmm-3i; Mon, 05 Aug 2019 22:11:30 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:33896) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hulCO-004Lmf-UD
 for samba-technical@lists.samba.org; Mon, 05 Aug 2019 22:11:27 +0000
Received: by mail-pf1-x429.google.com with SMTP id b13so40327229pfo.1
 for <samba-technical@lists.samba.org>; Mon, 05 Aug 2019 15:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=avf0I3xDvtapHifqv/odAO+t6/BXw+LDG5CHHKSQoq4=;
 b=QDAqLcqhv7esoL7rA1LG8Uqe/qY/x+JLg09ZgAD7L14FfhH/WekeuyC+XJ4U8450TF
 mZKbFvcB9jrdgE4KaNECn8DlbA4dEzWRMPT/PYR3qSso7Lrg8Khyu3lXjDDST9Trp5oD
 Vr15+vW0+rk7Yc0+TBJsU942j3VnNfanbh0Vu2WLXimqOT9btITw+bIRNDv+9sbPjeTN
 3C8C63tHYJbSspiM5khBGiTMPMNQzrTn1qdYUrpA6+QddWTvpUHXH6VEir2BYTd5tymM
 pm+H+3NkYEAJf469EkVdX0ixZOcDVapcUeV8RlLznjyhj8EbpDyQoil7RCKyBSCjgmrv
 TY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=avf0I3xDvtapHifqv/odAO+t6/BXw+LDG5CHHKSQoq4=;
 b=prxYeS4YW3AOy4czeL+6v2DKYNgp9NekcFePkpjs0H8wBvZLpYicxR7f6veDkwM2S9
 R9cZElpmxqStVvdmyQNPYa7SBPwlE4Zv2bWM47eG+FYqzBhn0aUhwxHTBUqaZnGZKqly
 U2iOBkqIY0X66qbtshFsYem4Gc3UCrJRXgs22AvQzNVlH58dERl/3ic/cXEz0ujy2Gy9
 FnZQgtZ7ZhKF2cvWSODJ7u0t2AWJE8mYrtCNFt/IzDqzDj8f89kske/Z22Rt/Jna6SMV
 jybz90Q3EIGihXITFJjymKHqdrtxLljb8xhYq4eccsWpv2ODVXnONdgzIibWRFbjqs8d
 /f1g==
X-Gm-Message-State: APjAAAXNzUIyfJZrzfAchz/NwsHuswW9XlPYu/MW+wSsn0zuPCiwQ+es
 wrqaCZWDwGVlZpYliCJoGTLsk5E9Tw/QWcwfnsw=
X-Google-Smtp-Source: APXvYqz3nx9Jb8DUXXXh+/N2s4tZGjhMHRVJm0mLhX3wBoqKzYicOSSTBYqS0oUK8XqjZiro96urihe4cKfvZ54XDGk=
X-Received: by 2002:a63:724b:: with SMTP id c11mr125368pgn.30.1565043082327;
 Mon, 05 Aug 2019 15:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <e51f32ff-ce54-d015-4ba0-572ec35f3e45@samba.org>
 <a8102b82-046b-c62a-29c9-a61ae563bf34@samba.org>
In-Reply-To: <a8102b82-046b-c62a-29c9-a61ae563bf34@samba.org>
Date: Mon, 5 Aug 2019 17:11:11 -0500
Message-ID: <CAH2r5mvJzTmg+mPDeDcS7RJzdtYV4Coq76fKkVBu3oysU6ihkA@mail.gmail.com>
Subject: Re: [MS-SMB2] 2.2.3.1.4 SMB2_NETNAME_NEGOTIATE_CONTEXT_ID
To: Stefan Metzmacher <metze@samba.org>
Content-Type: multipart/mixed; boundary="000000000000fb2c65058f65fca1"
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
Cc: "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000fb2c65058f65fca1
Content-Type: text/plain; charset="UTF-8"

How about this fix?


On Fri, Jul 26, 2019 at 3:29 AM Stefan Metzmacher via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Hi Steve,
>
> I just contacted dochelp for this and noticed (from reading the code)
> that the kernel sends null-termination for the
> SMB2_NETNAME_NEGOTIATE_CONTEXT_ID value.
>
> I think you should fix that and backport it to stable releases,
> it would be good if all clients would implement it like windows.
>
> I implemented it for Samba here:
> https://gitlab.com/samba-team/samba/merge_requests/666
>
> metze
>
> Am 26.07.19 um 10:22 schrieb Stefan Metzmacher via cifs-protocol:
> > Hi DocHelp,
> >
> > I just noticed a documentation bug in
> > [MS-SMB2] 2.2.3.1.4 SMB2_NETNAME_NEGOTIATE_CONTEXT_ID:
> >
> >    NetName (variable): A null-terminated Unicode string containing the
> >    server name and specified by the client application.
> >
> > Windows Server 1903 sends the name without null-termination, see the
> > attached capture.
> >
> > metze
>
>


-- 
Thanks,

Steve

--000000000000fb2c65058f65fca1
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-Incorrect-size-for-netname-negotiate-context.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-Incorrect-size-for-netname-negotiate-context.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jyyy8gf70>
X-Attachment-Id: f_jyyy8gf70

RnJvbSBmZDk3MjVlMThmOGM0MzZlMjI3NzgyMmVlZjAwMjViYWExZmU5YTJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IE1vbiwgNSBBdWcgMjAxOSAxNzowNzoyNiAtMDUwMApTdWJqZWN0OiBbUEFUQ0hdIHNt
YjM6IEluY29ycmVjdCBzaXplIGZvciBuZXRuYW1lIG5lZ290aWF0ZSBjb250ZXh0CgpJdCBpcyBu
b3QgbnVsbCB0ZXJtaW5hdGVkIChsZW5ndGggd2FzIG9mZiBieSB0d28pLgoKQWxzbyBzZWUgc2lt
aWxhciBjaGFuZ2UgdG8gU2FtYmE6CgpodHRwczovL2dpdGxhYi5jb20vc2FtYmEtdGVhbS9zYW1i
YS9tZXJnZV9yZXF1ZXN0cy82NjYKClJlcG9ydGVkLWJ5OiBTdGVmYW4gTWV0em1hY2hlciA8bWV0
emVAc2FtYmEub3JnPgpTaWduZWQtb2ZmLWJ5OiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jv
c29mdC5jb20+Ci0tLQogZnMvY2lmcy9zbWIycGR1LmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL2NpZnMvc21i
MnBkdS5jIGIvZnMvY2lmcy9zbWIycGR1LmMKaW5kZXggMzFlNGExYjBiMTcwLi41Y2MyYWIyZjJh
YzUgMTAwNjQ0Ci0tLSBhL2ZzL2NpZnMvc21iMnBkdS5jCisrKyBiL2ZzL2NpZnMvc21iMnBkdS5j
CkBAIC01MDMsOCArNTAzLDcgQEAgYnVpbGRfbmV0bmFtZV9jdHh0KHN0cnVjdCBzbWIyX25ldG5h
bWVfbmVnX2NvbnRleHQgKnBuZWdfY3R4dCwgY2hhciAqaG9zdG5hbWUpCiAJcG5lZ19jdHh0LT5D
b250ZXh0VHlwZSA9IFNNQjJfTkVUTkFNRV9ORUdPVElBVEVfQ09OVEVYVF9JRDsKIAogCS8qIGNv
cHkgdXAgdG8gbWF4IG9mIGZpcnN0IDEwMCBieXRlcyBvZiBzZXJ2ZXIgbmFtZSB0byBOZXROYW1l
IGZpZWxkICovCi0JcG5lZ19jdHh0LT5EYXRhTGVuZ3RoID0gY3B1X3RvX2xlMTYoMiArCi0JCSgy
ICogY2lmc19zdHJ0b1VURjE2KHBuZWdfY3R4dC0+TmV0TmFtZSwgaG9zdG5hbWUsIDEwMCwgY3Ap
KSk7CisJcG5lZ19jdHh0LT5EYXRhTGVuZ3RoID0gY3B1X3RvX2xlMTYoMiAqIGNpZnNfc3RydG9V
VEYxNihwbmVnX2N0eHQtPk5ldE5hbWUsIGhvc3RuYW1lLCAxMDAsIGNwKSk7CiAJLyogY29udGV4
dCBzaXplIGlzIERhdGFMZW5ndGggKyBtaW5pbWFsIHNtYjJfbmVnX2NvbnRleHQgKi8KIAlyZXR1
cm4gRElWX1JPVU5EX1VQKGxlMTZfdG9fY3B1KHBuZWdfY3R4dC0+RGF0YUxlbmd0aCkgKwogCQkJ
c2l6ZW9mKHN0cnVjdCBzbWIyX25lZ19jb250ZXh0KSwgOCkgKiA4OwotLSAKMi4yMC4xCgo=
--000000000000fb2c65058f65fca1--

