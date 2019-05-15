Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9C81FBFD
	for <lists+samba-technical@lfdr.de>; Wed, 15 May 2019 22:59:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=eSWd5kSIyPTWYpdKhakHfJUb4a1jDTXAX83Z1LBYhIE=; b=OlcRKXChDDrvauf0MwPgj5AR4W
	IcKRRyxQjW/dt5nQgUaRLufNvInY/YwqZmkJPE5Z6vmCDyYHxochHQFHJeYINiPh0cQyESu/Ly8N/
	Tqj+WWv5ikYI2tpZ86PL4hy26UkBGYZ+dvEedorbUhTpu0dFfbSHE92dPm/P7RkwCZw/Jul5whugF
	bcj6su349qdIHwJwHOKRzAdm8mqJ5JOGvGs74zdEzw+pDhH/sBw52wmbwRK1Z/rkUni3b2PiSlBcJ
	NExXHMJcQ0eak0uafwi+nGRYR/t8WeqtI3MaMqlElMh7G5UKjBcVWIwjPvFSDcXZBbCiGuUXQtqg8
	FV4pKcbw==;
Received: from localhost ([::1]:32656 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hR0zJ-003rgR-N2; Wed, 15 May 2019 20:58:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:31806) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hR0z7-003rgK-Vl
 for samba-technical@lists.samba.org; Wed, 15 May 2019 20:58:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=eSWd5kSIyPTWYpdKhakHfJUb4a1jDTXAX83Z1LBYhIE=; b=ZAHvMXMRCQMfse78c+G0tO+gKW
 nLFXZyZp/LoQUNLvxP1Mxndq6OW5cO4E7kqkLkSsUAVUYYI0vPl/bSK5DgpxsLtGnenBVxHqUSkNb
 czoEKxWxiYr31rK1fOLCq+Qfgol9WvdgafrPIwyU+P9fbKJsaW3GguSaf4tK+lMmLr+g=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hR0z6-0008IE-AW; Wed, 15 May 2019 20:58:44 +0000
Date: Wed, 15 May 2019 13:58:41 -0700
To: Shyam Rathi <shyam.rathi@nutanix.com>
Subject: Re: [PATCH] s3:loadparm: Ensure to truncate FS Volume Label at
 multibyte boundary
Message-ID: <20190515205841.GD253468@jra4>
References: <B15C9E07-0E0B-49CD-BDD8-0CD236C4F777@nutanix.com>
 <C15B0D71-E5FD-4071-8FCC-E63EBFC3003E@nutanix.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <C15B0D71-E5FD-4071-8FCC-E63EBFC3003E@nutanix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: asn@samba.org,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 ddiss@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, May 14, 2019 at 06:26:07PM +0000, Shyam Rathi via samba-technical wrote:
> https://bugzilla.samba.org/show_bug.cgi?id=13947
> 
> 
> To reproduce, create a share with a name where 32nd byte is not the first byte of a mutlibyte character. Using CJK characters (3 bytes each) is a possible approach. For example, creating a share with name 에이에프에스삼점오생성 and trying to open a txt file in Notepad gives the following error:
> 
>   Invalid character. For multibyte character sets, only the leading byte is
>   included without the trailing byte. For Unicode character sets, include
>   the characters 0xFFFF and 0xFFFE.
> 
> Looking at wireshark capture, the following is seen as source of this issue:
> 
>   GetInfo Request FS_INFO/FileFsVolumeInformation File: Rathi9\???????????
>   GetInfo Response, Error: STATUS_ILLEGAL_CHARACTER
> 
> Proposed solution is to truncate the label name at the end of a multibyte character before the 32nd byte.
> 
> Please review and suggest changes, improvements and other approaches.
> 
> Regards,
> -Shyamsunder Rathi (mailto:shyam.rathi@nutanix.com)

A few slight changes to make things clearer (to me at least :-).
Changes attached and bug ID added to the commit message. Let me
know if you're OK with it.

RB+. Can I get a second Team reviewer ?

Jeremy.

--r5Pyd7+fXNt84Ff3
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-s3-loadparm-Ensure-to-truncate-FS-Volume-Label-at-mu.patch"
Content-Transfer-Encoding: quoted-printable

=46rom cadad062f07d2c1f59cd690542dd17e1ebc37df7 Mon Sep 17 00:00:00 2001
=46rom: Shyamsunder Rathi <shyam.rathi@nutanix.com>
Date: Sun, 12 May 2019 23:06:17 -0700
Subject: [PATCH] s3:loadparm: Ensure to truncate FS Volume Label at multiby=
te
 boundary

For FS_VOLUME_INFO/FS_INFO operation, a maximum of 32 characters are
sent back. However, since Samba chops off any share name with >32
bytes at 32, it is possible that a multi-byte share name can get chopped
off between a full character. This causes the string decoding for unicode
failure which sends back NT_STATUS_ILLEGAL_CHARACTER (EILSEQ) to the client
applications.

On Windows, Notepad doesn't like it, and refuses to open a file in this
case and fails with the following error:

  Invalid character. For multibyte character sets, only the leading byte is
  included without the trailing byte. For Unicode character sets, include
  the characters 0xFFFF and 0xFFFE.

Proposed fix:
- Find the last starting point of a multibyte codepoint if the character
  at 32nd byte is a subsequent byte of a MB codepoint.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D13947

Signed-off-by: Shyamsunder Rathi <shyam.rathi@nutanix.com>
Reviewed-by: Hemanth Thummala <hemanth.thummala@nutanix.com>
Reviewed-by: Jeremy Allison <jra@samba.org>
---
 source3/param/loadparm.c | 38 +++++++++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/source3/param/loadparm.c b/source3/param/loadparm.c
index 5af1621fb9b..5104a3408f1 100644
--- a/source3/param/loadparm.c
+++ b/source3/param/loadparm.c
@@ -4244,15 +4244,47 @@ const char *volume_label(TALLOC_CTX *ctx, int snum)
 {
 	char *ret;
 	const char *label =3D lp_volume(ctx, snum);
+	size_t end =3D 32;
+
 	if (!*label) {
 		label =3D lp_servicename(ctx, snum);
 	}
=20
-	/* This returns a 33 byte guarenteed null terminated string. */
-	ret =3D talloc_strndup(ctx, label, 32);
+	/*
+	 * Volume label can be a max of 32 bytes. Make sure to truncate
+	 * it at a codepoint boundary if it's longer than 32 and contains
+	 * multibyte characters. Windows insists on a volume label being
+	 * a valid mb sequence, and errors out if not.
+	 */
+	if (strlen(label) > 32) {
+		/*
+		 * A MB char can be a max of 5 bytes, thus
+		 * we should have a valid mb character at a
+		 * minimum position of (32-5) =3D 27.
+		 */
+		while (end >=3D 27) {
+			/*
+			 * Check if a codepoint starting from next byte
+			 * is valid. If yes, then the current byte is the
+			 * end of a MB or ascii sequence and the label can
+			 * be safely truncated here. If not, keep going
+			 * backwards till a valid codepoint is found.
+			 */
+			size_t len =3D 0;
+			const char *s =3D &label[end];
+			codepoint_t c =3D next_codepoint(s, &len);
+			if (c !=3D INVALID_CODEPOINT) {
+				break;
+			}
+			end--;
+		}
+	}
+
+	/* This returns a max of 33 byte guarenteed null terminated string. */
+	ret =3D talloc_strndup(ctx, label, end);
 	if (!ret) {
 		return "";
-	}	=09
+	}
 	return ret;
 }
=20
--=20
2.21.0.1020.gf2820cf01a-goog


--r5Pyd7+fXNt84Ff3--

