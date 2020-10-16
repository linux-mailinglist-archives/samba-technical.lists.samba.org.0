Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E7628FDD1
	for <lists+samba-technical@lfdr.de>; Fri, 16 Oct 2020 07:50:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=cbKiAEp9k1tMZbQR86QytwGCXl0Fu0JNGXivlAOZDCw=; b=H1Fu9ppJZF59HOTNA3srojB7oe
	d8rkQlR7FY1UKWSlL8bglWsj0lAP0METhb/MkplOzk2fp1IrrO1a2tmwGyhara9iJRp7WFDySHg/7
	y8xGvpBSZCPhVSu+mGe21kEpWiriHH95E7YSAG7XSuPpHZzKkhOpI5NLWidHTqDfSUy4TLbIi/zi3
	/sUR57mwV1Hg/Nwiyoh1eVB9DI1FekazOuB+h4iPblzpC5a+6Km7GI/VnzkZNqxtbsIGEt4NXCky1
	FQAxPn0XQe/JJvnnDbUFLd38BSbjafTE7euaUJJ1ylWCqFaPJ9vp51ZqVHKZqr1PCEz3FgqlNRUnm
	emMcwJPA==;
Received: from ip6-localhost ([::1]:36866 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTIcQ-00CNNy-1a; Fri, 16 Oct 2020 05:49:34 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:41826) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTIcJ-00CNNq-Bw
 for samba-technical@lists.samba.org; Fri, 16 Oct 2020 05:49:30 +0000
Received: by mail-lj1-x236.google.com with SMTP id p15so1170240ljj.8
 for <samba-technical@lists.samba.org>; Thu, 15 Oct 2020 22:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cbKiAEp9k1tMZbQR86QytwGCXl0Fu0JNGXivlAOZDCw=;
 b=Dz7lB4VsuP5WyWgzjN8JdJnJjuW5nAUJeny9ZPT8BA8A93ZUARKXD5/Bjcu30T6ZXx
 IbqeEElu7Bv7Vlo9twYXQ3//NgS3OEksAweWO+NRe2YLKVSU6/nOgOKdBUt0+SExtgtB
 btUoXxpxveYfc519PXHtRiyOeoGBJSb/Fa9SRrkFQMMiSy5OifHaXuwWEmy5lS1aYHTE
 vT4ad4NBhLTXki7izQiPTfthfUZwR6Ml+fIZkHrMuIyU8JtHl5n1yaWBpGKUS4yvwKHK
 1BY30cMY7/iKMO3ng/a7PFBthfOkTgVtMBAGrb/nnsOyg0Hin0ku43VT4Nx+CKgLpy1b
 nnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cbKiAEp9k1tMZbQR86QytwGCXl0Fu0JNGXivlAOZDCw=;
 b=JW5lfo4DVv5xmYVwFup1hQvx75xj6XzBVTzHJ2Zo3tf7MjAPQAHNynxRH1I8arp3oY
 N84r1yxY/iTIB9dboBByPkiykXZMLCBmtNj1bBzH0wm7m74XEE6USEWyo1m7ABPXXm/w
 U2q+Hca2lsAx1okLfldagXT1a0X9JF7ropCNILTFvJ5VsK12YM8Hodsn1fFAnVo1HbDo
 BnHv0Yo3fXCEK3ctHdQL3561xjKG2NP7Sggm+45tbvbJJ/l/rltd/SLN42b0lWyQ3H/F
 rjuHrPEETgnDewFk2MdFafQA/AqST2BEtMhD5Lex4eYNDifPNwla6rq0oouDf+032YgH
 LN/g==
X-Gm-Message-State: AOAM532Q1yetFplkVAdUYZOX07lUlNRsp0Jm5YZ6aBvDYj4Fl7oxU74V
 eW9OFQ56YMWcR6J9k0tsFOTKDJA8DMClUuvQZyI=
X-Google-Smtp-Source: ABdhPJySxZFZalXg70WiFelurJdZRits+GPnzQZXL6VQoDLSWdFSZ18L8QewqXiqGY9n/hICCicBhifWHwAVQkWVgKI=
X-Received: by 2002:a2e:a376:: with SMTP id i22mr843333ljn.325.1602827366129; 
 Thu, 15 Oct 2020 22:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mtwBHTk-Xoeuo+RbgNwiNw-cWTAhdy1YG5y+vXnNDSv4w@mail.gmail.com>
 <bd8f21ed-5fd4-0974-f15a-16d2f3ee607f@samba.org> <87r1q3hixr.fsf@suse.com>
 <827fd43f-40a9-9480-a6b9-aea1fa69090c@talpey.com>
 <CAH2r5mt3t=FHVd8RtCyrzY6TUKb+rGENENXbKJBgUdq4T4Qe6Q@mail.gmail.com>
In-Reply-To: <CAH2r5mt3t=FHVd8RtCyrzY6TUKb+rGENENXbKJBgUdq4T4Qe6Q@mail.gmail.com>
Date: Fri, 16 Oct 2020 00:49:15 -0500
Message-ID: <CAH2r5mu72VSPFhiLjL3YUtStXc1=B5SBP86+A5vEWFhLFyOJBw@mail.gmail.com>
Subject: Re: [PATCH][SMB3.1.1] Add defines for new signing context
To: Tom Talpey <tom@talpey.com>
Content-Type: multipart/mixed; boundary="000000000000cb76d705b1c353c4"
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
Cc: Stefan Metzmacher <metze@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000cb76d705b1c353c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Here is a patch to add a module load parm that is turned off by
default to allow users to enable it for experimentation

# ls /sys/module/cifs/parameters/
CIFSMaxBufSize    cifs_min_small           enable_oplocks
cifs_max_pending  disable_legacy_dialects  enable_signing_negcontext
cifs_min_rcv      enable_gcm_256           require_gcm_256

# cat /sys/module/cifs/parameters/enable_signing_negcontext
N

On Thu, Oct 15, 2020 at 11:50 PM Steve French <smfrench@gmail.com> wrote:
>
> > suggest wrapping this context and the integrity algs in some kind of co=
nditional
>
> I have a couple patches to send the context (which I haven't merged
> yet, because, similar to what you suggested, I wanted to make sure
> they were disabled by default).
>
> Tentative plan was to have them disabled by default, and sending the
> new context can be enabled for testing by a module parameter (e.g.
> "echo 1 >  /sys/modules/cifs/parameters/enable_signing_context"  or
> some similar config variable name)
>
> On Thu, Oct 15, 2020 at 1:15 PM Tom Talpey <tom@talpey.com> wrote:
> >
> > On 10/12/2020 5:50 AM, Aur=C3=A9lien Aptel wrote:
> > > Patch LGTM
> > >
> > > Reviewed-by: Aurelien Aptel <aaptel@suse.com>
> > >
> > > Stefan Metzmacher via samba-technical <samba-technical@lists.samba.or=
g>
> > >> This isn't in MS-SMB2 yet.
> > >>
> > >> Is this AES_128?
> > >
> > > This is returned in latest Windows Server Insider builds but it's not
> > > documented yet.
> > >
> > > https://www.microsoft.com/en-us/software-download/windowsinsiderprevi=
ewserver
> > >
> > > I've asked dochelp about it during the SDC plugfest and they gave me
> > > this:
> > >
> > >      The new ContextType is:
> > >      SMB2_SIGNING_CAPABILITIES 0x0008
> > >      The Data field contains a list of signing algorithms.
> > >      =E2=80=A2    It adds a new negotiate context, which enables SMB =
to decouple signing algorithms from dialects. E.g. if both client and serve=
r supports it, a session may use HMAC-SHA256 with SMB 3.1.1.
> > >      =E2=80=A2    It adds the AES-GMAC algorithm.
> > >
> > >      SigningAlgorithmCount (2 bytes): Count of signing algorithms
> > >      SigningAlgorithms (variable): An array of SigningAlgorithmCount =
16-bit integer IDs specifying the supported signing algorithms.
> > >
> > >      The following IDs are assigned:
> > >      0 =3D HMAC-SHA256
> > >      1 =3D AES-CMAC
> > >      2 =3D AES-GMAC
> > >
> > >
> > > I've been CCed in a Microsoft email thread later on and it seems to b=
e
> > > unclear why this was missed/wasn't documented. Maybe this is subject =
to
> > > change so take with a grain of salt.
> >
> > Just curious if you've heard back on this. Insider builds will sometime=
s
> > support things that don't make it to the release. Even Preview docs can
> > change. However, AES_GMAC has been on the radar since 2015 (*) so
> > perhaps the time has come!
> >
> > I'd suggest wrapping this context and the integrity algs in some kind o=
f
> > conditional, in case this is delayed...
> >
> > Tom.
> >
> > (*) slide 29+
> > https://www.snia.org/sites/default/files/SDC15_presentations/smb/GregKr=
amer_%20SMB_3-1-1_rev.pdf
>
>
>
> --
> Thanks,
>
> Steve



--=20
Thanks,

Steve

--000000000000cb76d705b1c353c4
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-SMB3.1.1-add-new-module-load-parm-enable_signing_neg.patch"
Content-Disposition: attachment; 
	filename="0001-SMB3.1.1-add-new-module-load-parm-enable_signing_neg.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kgbtylh10>
X-Attachment-Id: f_kgbtylh10

RnJvbSA5YWY3MjRmMWU1NWYzYjNlZTg0ZGU1MDExNzZlOGI1OTUwMTU2NTczIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IEZyaSwgMTYgT2N0IDIwMjAgMDA6NDI6MzYgLTA1MDAKU3ViamVjdDogW1BBVENIXSBT
TUIzLjEuMTogYWRkIG5ldyBtb2R1bGUgbG9hZCBwYXJtIGVuYWJsZV9zaWduaW5nX25lZ2NvbnRl
eHQKCkFkZCBuZXcgbW9kdWxlIGxvYWQgcGFyYW1ldGVyIGVuYWJsZV9zaWduaW5nX25lZ2NvbnRl
eHQuIElmIHNldAooaXQgaXMgZGlzYWJsZWQgYnkgZGVmYXVsdCBhbmQgZXhwZXJpbWVudGFsKSB0
aGVuIHNlbmQgdGhlIG5ldwpzaWduaW5nIG5lZ290aWF0ZSBjb250ZXh0IHRvIGFsbG93IHRoZSBz
ZXJ2ZXIgYW5kIGNsaWVudCB0bwpuZWdvdGlhdGUgd2hpY2ggZWFjaCBvdGhlciB0aGUgcHJlZmVy
cmVkIHNpZ25pbmcgYWxnb3JpdGhtLgoKU2lnbmVkLW9mZi1ieTogU3RldmUgRnJlbmNoIDxzdGZy
ZW5jaEBtaWNyb3NvZnQuY29tPgotLS0KIGZzL2NpZnMvY2lmc2ZzLmMgICB8IDQgKysrKwogZnMv
Y2lmcy9jaWZzZ2xvYi5oIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2ZzL2NpZnMvY2lmc2ZzLmMgYi9mcy9jaWZzL2NpZnNmcy5jCmluZGV4IDQ3
MmNiNzc3N2UzZS4uY2E0MWFkMjkyZDA1IDEwMDY0NAotLS0gYS9mcy9jaWZzL2NpZnNmcy5jCisr
KyBiL2ZzL2NpZnMvY2lmc2ZzLmMKQEAgLTcxLDYgKzcxLDcgQEAgYm9vbCBlbmFibGVfb3Bsb2Nr
cyA9IHRydWU7CiBib29sIGxpbnV4RXh0RW5hYmxlZCA9IHRydWU7CiBib29sIGxvb2t1cENhY2hl
RW5hYmxlZCA9IHRydWU7CiBib29sIGRpc2FibGVfbGVnYWN5X2RpYWxlY3RzOyAvKiBmYWxzZSBi
eSBkZWZhdWx0ICovCitib29sIGVuYWJsZV9zaWduaW5nX25lZ2NvbnRleHQ7IC8qIGZhbHNlIGJ5
IGRlZmF1bHQsIGV4cGVyaW1lbnRhbCAqLwogYm9vbCBlbmFibGVfZ2NtXzI1NjsgIC8qIGZhbHNl
IGJ5IGRlZmF1bHQsIGNoYW5nZSB3aGVuIG1vcmUgc2VydmVycyBzdXBwb3J0IGl0ICovCiBib29s
IHJlcXVpcmVfZ2NtXzI1NjsgLyogZmFsc2UgYnkgZGVmYXVsdCAqLwogdW5zaWduZWQgaW50IGds
b2JhbF9zZWNmbGFncyA9IENJRlNTRUNfREVGOwpAQCAtMTA2LDYgKzEwNyw5IEBAIE1PRFVMRV9Q
QVJNX0RFU0Moc2xvd19yc3BfdGhyZXNob2xkLCAiQW1vdW50IG9mIHRpbWUgKGluIHNlY29uZHMp
IHRvIHdhaXQgIgogbW9kdWxlX3BhcmFtKGVuYWJsZV9vcGxvY2tzLCBib29sLCAwNjQ0KTsKIE1P
RFVMRV9QQVJNX0RFU0MoZW5hYmxlX29wbG9ja3MsICJFbmFibGUgb3IgZGlzYWJsZSBvcGxvY2tz
LiBEZWZhdWx0OiB5L1kvMSIpOwogCittb2R1bGVfcGFyYW0oZW5hYmxlX3NpZ25pbmdfbmVnY29u
dGV4dCwgYm9vbCwgMDY0NCk7CitNT0RVTEVfUEFSTV9ERVNDKGVuYWJsZV9zaWduaW5nX25lZ2Nv
bnRleHQsICJFbmFibGUgZXhwZXJpbWVudGFsIG5lZ290aWF0aW9uIG9mIHBhY2tldCBzaWduaW5n
IGFsZ29yaXRobS4gRGVmYXVsdDogbi9OLzAiKTsKKwogbW9kdWxlX3BhcmFtKGVuYWJsZV9nY21f
MjU2LCBib29sLCAwNjQ0KTsKIE1PRFVMRV9QQVJNX0RFU0MoZW5hYmxlX2djbV8yNTYsICJFbmFi
bGUgcmVxdWVzdGluZyBzdHJvbmdlc3QgKDI1NiBiaXQpIEdDTSBlbmNyeXB0aW9uLiBEZWZhdWx0
OiBuL04vMCIpOwogCmRpZmYgLS1naXQgYS9mcy9jaWZzL2NpZnNnbG9iLmggYi9mcy9jaWZzL2Np
ZnNnbG9iLmgKaW5kZXggYTFhMWExNmFjYjM4Li41NDRkYzA2Y2FkNTcgMTAwNjQ0Ci0tLSBhL2Zz
L2NpZnMvY2lmc2dsb2IuaAorKysgYi9mcy9jaWZzL2NpZnNnbG9iLmgKQEAgLTE5NTYsNiArMTk1
Niw3IEBAIGV4dGVybiBib29sIGxvb2t1cENhY2hlRW5hYmxlZDsKIGV4dGVybiB1bnNpZ25lZCBp
bnQgZ2xvYmFsX3NlY2ZsYWdzOwkvKiBpZiBvbiwgc2Vzc2lvbiBzZXR1cCBzZW50CiAJCQkJd2l0
aCBtb3JlIHNlY3VyZSBudGxtc3NwMiBjaGFsbGVuZ2UvcmVzcCAqLwogZXh0ZXJuIHVuc2lnbmVk
IGludCBzaWduX0NJRlNfUERVczsgIC8qIGVuYWJsZSBzbWIgcGFja2V0IHNpZ25pbmcgKi8KK2V4
dGVybiBib29sIGVuYWJsZV9zaWduaW5nX25lZ2NvbnRleHQ7IC8qIGFsbG93IGV4cGVyaW1lbnRh
bCBuZWdvdGlhdGUgb2Ygc2lnbmluZyBhbGdvcml0aG1zICovCiBleHRlcm4gYm9vbCBlbmFibGVf
Z2NtXzI1NjsgLyogYWxsb3cgb3B0aW9uYWwgbmVnb3RpYXRlIG9mIHN0cm9uZ2VzdCBzaWduaW5n
IChhZXMtZ2NtLTI1NikgKi8KIGV4dGVybiBib29sIHJlcXVpcmVfZ2NtXzI1NjsgLyogcmVxdWly
ZSB1c2Ugb2Ygc3Ryb25nZXN0IHNpZ25pbmcgKGFlcy1nY20tMjU2KSAqLwogZXh0ZXJuIGJvb2wg
bGludXhFeHRFbmFibGVkOy8qZW5hYmxlIExpbnV4L1VuaXggQ0lGUyBleHRlbnNpb25zKi8KLS0g
CjIuMjUuMQoK
--000000000000cb76d705b1c353c4--

