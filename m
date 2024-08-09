Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6390C94D3ED
	for <lists+samba-technical@lfdr.de>; Fri,  9 Aug 2024 17:47:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=NWYsmV8/lUnyC4yFYPD2C6vKhh+g+kN7n8dvQWyHoKo=; b=Tglcxww+03qPksmpxJqem2k06V
	XkjKiXj/VziRazcWNkIr7MRvh2yCIviqKLjqsNJF2KKkQzPNzoZyTYdeEnOVq82krozZwl0CQ0Gum
	AxWo4Upbi2rnW5VRdXxYtbx56jpn8m3cyFZ+IsuxDkTkXW6aN0We9W7K3iMSfP//eoQZ1Va8Biu6j
	C7SsSUhfQ6/7lkzlBI34yxbIsgXt+z8CHIcOcgyUbGhYNuy7LnHnRp8HqQTm2IckAGcc40eKwM4eB
	BSqeXW2K2UDT39CdD14EcYYeaR0ScxM9LBaMMwUIB+0ISJ1gleZaA+WHZHTSkyFMskBbaoFSIXmAh
	Oh5f1fXg==;
Received: from ip6-localhost ([::1]:55558 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1scRpe-004Gv2-VP; Fri, 09 Aug 2024 15:47:11 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:46512) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1scRpa-004Guv-0a
 for samba-technical@lists.samba.org; Fri, 09 Aug 2024 15:47:08 +0000
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2f0271b0ae9so22431201fa.1
 for <samba-technical@lists.samba.org>; Fri, 09 Aug 2024 08:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723218424; x=1723823224; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NWYsmV8/lUnyC4yFYPD2C6vKhh+g+kN7n8dvQWyHoKo=;
 b=krIQd6N6KL6yMhsR5Tb2KuUX+WWsigmH4b/YiJbtlhEOjG0b/prtDlLbgGx1wXk7fC
 vmF5b7CA0h2YTHl2NfRKiWa/ey7XKWjRdjDMX9ffXTuSqn9vW5hY/LTzt0Fa3rrvywLi
 +JwyubDKHmHswrWgFMtMTWpJODtJMPvcgZ4TIVinUnQOJ0Kjr2XCYuZociaztB0zvsaJ
 e0xaMVUw+KwQ7c3EwXsjgxlEALGyvVvdg3SNU7GHALzwlcboC9l5hh11HDcFZsjCg1aV
 PkAG8bThT6vCkZIy1Lw7O8M3yhWQktxUfEKkOg+4dZ6nBvlHwWNDr0TMoBY0oNeMd+7g
 c3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723218424; x=1723823224;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NWYsmV8/lUnyC4yFYPD2C6vKhh+g+kN7n8dvQWyHoKo=;
 b=iNFAvFNHT65/3aAnfSyxZ6Tldj157YypJzeF0AXDbjlBachriV2Dv9wvoSN9uO46P1
 cgm63isul+yizfJfK2MynwePiXv9Nb72mlV2rZ+7E8x0KcFKlxyA0i+QfTssz0GuGr8a
 APaT+g+yxJhMKdhTW5CaX10MGSJcszTY0AD/LjLrjWMfKQCIzDKc++8MeqJ6nXE7mdOU
 RQd9X8wDwK8YNeSfvXG1NFFJf/p6NUnOGFvqf8G1sKXj4HA9MgU4+8rkUABuYj4VEcKA
 a4RPhT/J1hGEZcpDSnpp5eAcj5FamADLBS27pBqfna3CcnY33NkUJvE0YmWwm16/LJaV
 nKFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwiYuTRYFKO8mH3GZip2tHJzhzrl4N1NfT/mRHB/kWHe39eShlSXfh1PTEsdmexeZrmFLH57kUe8yvdokmo5lwm8do4btcM/TLFSy92eHq
X-Gm-Message-State: AOJu0YyF/05qInvs+F2IZpI8SRG15yL1jiHMflysbXDPsx8HdDQEK6vf
 f0Jr0fVsbVs5UAnTGiXPAnyTLGfWVJEhB4RRmAKkdaZ9ED5CZmCnFIoCmQjWp5NAw5D8k6411LD
 6ee7HdMy+v/O/ldNFXEPmWFALJIU=
X-Google-Smtp-Source: AGHT+IH6yg1l8e+9EMuLYJcwcxTnDSaQ04Pd16fOj7UNBoTdgJ0dazsX16YcIOqGr59IOdst9bLTdGwjdcNGQymaQWg=
X-Received: by 2002:a05:6512:39cd:b0:52c:cc38:592c with SMTP id
 2adb3069b0e04-530ee8b8773mr1614616e87.0.1723218423602; Fri, 09 Aug 2024
 08:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240808122331.342473-1-suhui@nfschina.com>
 <893f2ebb-2979-4e34-bdab-a7cbb0c7e7b8@stanley.mountain>
 <a08c6b03-6d23-4711-a891-14b0250b90be@stanley.mountain>
 <CAH2r5msS8_Jc0hRXqY==OGiaoJKyjqkh7HT0esSKcEvsxht46Q@mail.gmail.com>
In-Reply-To: <CAH2r5msS8_Jc0hRXqY==OGiaoJKyjqkh7HT0esSKcEvsxht46Q@mail.gmail.com>
Date: Fri, 9 Aug 2024 10:46:52 -0500
Message-ID: <CAH2r5mu2FkMGNKrbU+Kt3BeutzM4AyKZFjbWXg+zioPzQofDSw@mail.gmail.com>
Subject: Re: [PATCH] smb/client: avoid possible NULL dereference in
 cifs_free_subrequest()
To: Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: multipart/mixed; boundary="00000000000002e99c061f420e99"
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
Cc: pc@manguebit.com, sfrench@samba.org, sprasad@microsoft.com,
 llvm@lists.linux.dev, Su Hui <suhui@nfschina.com>, linux-cifs@vger.kernel.org,
 kernel-janitors@vger.kernel.org, samba-technical@lists.samba.org,
 nathan@kernel.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, bharathsm@microsoft.com, tom@talpey.com,
 morbo@google.com, justinstitt@google.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--00000000000002e99c061f420e99
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Updated patch to change Fixes tag and Cc: David


On Fri, Aug 9, 2024 at 10:42=E2=80=AFAM Steve French <smfrench@gmail.com> w=
rote:
>
> On Fri, Aug 9, 2024 at 10:11=E2=80=AFAM Dan Carpenter <dan.carpenter@lina=
ro.org> wrote:
> >
> > On Fri, Aug 09, 2024 at 06:00:26PM +0300, Dan Carpenter wrote:
> > > On Thu, Aug 08, 2024 at 08:23:32PM +0800, Su Hui wrote:
> > > > Clang static checker (scan-build) warning:
> > > >     cifsglob.h:line 890, column 3
> > > >     Access to field 'ops' results in a dereference of a null pointe=
r.
> > > >
> > > > Commit 519be989717c ("cifs: Add a tracepoint to track credits invol=
ved in
> > > > R/W requests") adds a check for 'rdata->server', and let clang thro=
w this
> > > > warning about NULL dereference.
> > > >
> > > > When 'rdata->credits.value !=3D 0 && rdata->server =3D=3D NULL' hap=
pens,
> > > > add_credits_and_wake_if() will call rdata->server->ops->add_credits=
().
> > > > This will cause NULL dereference problem. Add a check for 'rdata->s=
erver'
> > > > to avoid NULL dereference.
> > > >
> > > > Signed-off-by: Su Hui <suhui@nfschina.com>
> > >
> > > Needs a Fixes tag.
> > >
> > > Also when you add a Fixes tag, then get_maintainer will add the David=
 Howells
> > > automatically.  I've added him manually.
> > >
> >
> > Actually, David should have been CC'd but the fixes tag wouldn't have p=
ointed
> > to his patch.
> >
> > This is an inconsistent NULL checking warning.  It's not clear to me if=
 the NULL
> > checks should be removed or more added.  If David were trying to fix a =
NULL
> > pointer dereference and accidentally left one unchecked dereference out=
 then the
> > Fixes tag would point to his patch.  Since David was doing something un=
related
>
> Looks like (if this is even possible for server to to be null) then I
> will need to change
> the fixes to commit 69c3c023af25. I will update the tag in the current
> patch in for-next
>
> Author: David Howells <dhowells@redhat.com>
> Date:   Fri Oct 6 18:16:15 2023 +0100
>
>     cifs: Implement netfslib hooks
>
>     Provide implementation of the netfslib hooks that will be used by net=
fslib
>     to ask cifs to set up and perform operations.
> --
> Thanks,
>
> Steve



--=20
Thanks,

Steve

--00000000000002e99c061f420e99
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb-client-avoid-possible-NULL-dereference-in-cifs_f.patch"
Content-Disposition: attachment; 
	filename="0001-smb-client-avoid-possible-NULL-dereference-in-cifs_f.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lzmvqytv0>
X-Attachment-Id: f_lzmvqytv0

RnJvbSA1OWFjMWFhYzE1NTA3MzFjYTI0MTAwN2FmNjYwZmM1Mjc4Yzg4MTM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdSBIdWkgPHN1aHVpQG5mc2NoaW5hLmNvbT4KRGF0ZTogVGh1
LCA4IEF1ZyAyMDI0IDIwOjIzOjMyICswODAwClN1YmplY3Q6IFtQQVRDSF0gc21iL2NsaWVudDog
YXZvaWQgcG9zc2libGUgTlVMTCBkZXJlZmVyZW5jZSBpbgogY2lmc19mcmVlX3N1YnJlcXVlc3Qo
KQoKQ2xhbmcgc3RhdGljIGNoZWNrZXIgKHNjYW4tYnVpbGQpIHdhcm5pbmc6CgljaWZzZ2xvYi5o
OmxpbmUgODkwLCBjb2x1bW4gMwoJQWNjZXNzIHRvIGZpZWxkICdvcHMnIHJlc3VsdHMgaW4gYSBk
ZXJlZmVyZW5jZSBvZiBhIG51bGwgcG9pbnRlci4KCkNvbW1pdCA1MTliZTk4OTcxN2MgKCJjaWZz
OiBBZGQgYSB0cmFjZXBvaW50IHRvIHRyYWNrIGNyZWRpdHMgaW52b2x2ZWQgaW4KUi9XIHJlcXVl
c3RzIikgYWRkcyBhIGNoZWNrIGZvciAncmRhdGEtPnNlcnZlcicsIGFuZCBsZXQgY2xhbmcgdGhy
b3cgdGhpcwp3YXJuaW5nIGFib3V0IE5VTEwgZGVyZWZlcmVuY2UuCgpXaGVuICdyZGF0YS0+Y3Jl
ZGl0cy52YWx1ZSAhPSAwICYmIHJkYXRhLT5zZXJ2ZXIgPT0gTlVMTCcgaGFwcGVucywKYWRkX2Ny
ZWRpdHNfYW5kX3dha2VfaWYoKSB3aWxsIGNhbGwgcmRhdGEtPnNlcnZlci0+b3BzLT5hZGRfY3Jl
ZGl0cygpLgpUaGlzIHdpbGwgY2F1c2UgTlVMTCBkZXJlZmVyZW5jZSBwcm9ibGVtLiBBZGQgYSBj
aGVjayBmb3IgJ3JkYXRhLT5zZXJ2ZXInCnRvIGF2b2lkIE5VTEwgZGVyZWZlcmVuY2UuCgpDYzog
c3RhYmxlQHZnZXIua2VybmVsLm9yZwpGaXhlczogNjljM2MwMjNhZjI1ICgiY2lmczogSW1wbGVt
ZW50IG5ldGZzbGliIGhvb2tzIikKQ2M6IERhdmlkIEhvd2VsbHMgPGRob3dlbGxzQHJlZGhhdC5j
b20+ClNpZ25lZC1vZmYtYnk6IFN1IEh1aSA8c3VodWlAbmZzY2hpbmEuY29tPgpTaWduZWQtb2Zm
LWJ5OiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+Ci0tLQogZnMvc21iL2Ns
aWVudC9maWxlLmMgfCA4ICsrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL3NtYi9jbGllbnQvZmlsZS5jIGIvZnMv
c21iL2NsaWVudC9maWxlLmMKaW5kZXggYjI0MDVkZDRkNGQ0Li40NTQ1OWFmNTA0NGQgMTAwNjQ0
Ci0tLSBhL2ZzL3NtYi9jbGllbnQvZmlsZS5jCisrKyBiL2ZzL3NtYi9jbGllbnQvZmlsZS5jCkBA
IC0zMTUsNyArMzE1LDcgQEAgc3RhdGljIHZvaWQgY2lmc19mcmVlX3N1YnJlcXVlc3Qoc3RydWN0
IG5ldGZzX2lvX3N1YnJlcXVlc3QgKnN1YnJlcSkKICNlbmRpZgogCX0KIAotCWlmIChyZGF0YS0+
Y3JlZGl0cy52YWx1ZSAhPSAwKQorCWlmIChyZGF0YS0+Y3JlZGl0cy52YWx1ZSAhPSAwKSB7CiAJ
CXRyYWNlX3NtYjNfcndfY3JlZGl0cyhyZGF0YS0+cnJlcS0+ZGVidWdfaWQsCiAJCQkJICAgICAg
cmRhdGEtPnN1YnJlcS5kZWJ1Z19pbmRleCwKIAkJCQkgICAgICByZGF0YS0+Y3JlZGl0cy52YWx1
ZSwKQEAgLTMyMyw4ICszMjMsMTIgQEAgc3RhdGljIHZvaWQgY2lmc19mcmVlX3N1YnJlcXVlc3Qo
c3RydWN0IG5ldGZzX2lvX3N1YnJlcXVlc3QgKnN1YnJlcSkKIAkJCQkgICAgICByZGF0YS0+c2Vy
dmVyID8gcmRhdGEtPnNlcnZlci0+aW5fZmxpZ2h0IDogMCwKIAkJCQkgICAgICAtcmRhdGEtPmNy
ZWRpdHMudmFsdWUsCiAJCQkJICAgICAgY2lmc190cmFjZV9yd19jcmVkaXRzX2ZyZWVfc3VicmVx
KTsKKwkJaWYgKHJkYXRhLT5zZXJ2ZXIpCisJCQlhZGRfY3JlZGl0c19hbmRfd2FrZV9pZihyZGF0
YS0+c2VydmVyLCAmcmRhdGEtPmNyZWRpdHMsIDApOworCQllbHNlCisJCQlyZGF0YS0+Y3JlZGl0
cy52YWx1ZSA9IDA7CisJfQogCi0JYWRkX2NyZWRpdHNfYW5kX3dha2VfaWYocmRhdGEtPnNlcnZl
ciwgJnJkYXRhLT5jcmVkaXRzLCAwKTsKIAlpZiAocmRhdGEtPmhhdmVfeGlkKQogCQlmcmVlX3hp
ZChyZGF0YS0+eGlkKTsKIH0KLS0gCjIuNDMuMAoK
--00000000000002e99c061f420e99--

