Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 998225BB1A
	for <lists+samba-technical@lfdr.de>; Mon,  1 Jul 2019 14:00:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=rFJPG5P00NF2zruzKTrKOUjSnDyIYzy1iKZeXLoRFdY=; b=LM3C63CED/FujnfHM08JQz9C1h
	QUZeSseNcheIq9SSdNVYma2ErjM8vIS+WVk486XRO8VJ52frR5WR84l5hRhO+ckmYYoybAAlMmedE
	FMJ17NgUCmdSjjdspJPg7/0jIv01znPwyiMa3+75Tkvrug9iV2tAADXRyJCud0bGouttN/DT0p6CP
	5bZWHujJeIBE+zvpHQzQV4cT2/Hl0eq1xVfvjV+fbxPthAkfCop8Hq2rA38aqK7l8r1twIG/dvQfH
	UiZ01EZmxK7OX+imwSj6rRPibpdYM4EOGzF7PI2mdW7bx1vbH7mEyrNA2YELZo/orgPbq20s/9JLX
	qgu4jTyQ==;
Received: from localhost ([::1]:20570 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hhuyr-004IPR-8B; Mon, 01 Jul 2019 12:00:21 +0000
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43]:36916) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hhuyd-004IMm-GW
 for samba-technical@lists.samba.org; Mon, 01 Jul 2019 12:00:10 +0000
Received: by mail-yw1-xc43.google.com with SMTP id u141so5728152ywe.4
 for <samba-technical@lists.samba.org>; Mon, 01 Jul 2019 05:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=6NSsrKyrG4UM5Ts3j1PUrpitpqaTF+K8JIU01lbh81s=;
 b=OuVkiIkUuAPvEGr1I7M/WTfqVRKD2vPdES6EdD4BciYz0T2kMoFdHrmyTmuWMvG0ks
 rppgjWUKpbTedBJfmzaACacsC1o8Pq/4W3CHqfCNiXcfWvrDWNF6S6/hZBQ/ETzJlfIJ
 zjGjy+FEwraXL2FKonSWW9CrlVNj+o/JLjh0COeut0c98tu0hxMo4E1/5W0+u8PYx8UH
 9D2falQGIUfpuiL9ry0GlloGiSndrS1PKUh6kqf5yy1a4WGxOV59O3h/rSH3LDirJnwE
 KT4ekSqIJYyOeGLgdwEUB5sqhdSryvWsuDzNHRMyqY61jXTxc4rdTEup7tobpDhrAqjs
 +hfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=6NSsrKyrG4UM5Ts3j1PUrpitpqaTF+K8JIU01lbh81s=;
 b=tNrfGcUf4uQ6EI7EGKP2HsEoCGB3fAIWS1snp0vEG2wnHvXQFTBloZdJxcYo0SoktI
 PrsmuihYj4tO094+27DBGOsybjXxb+QKyx8ocS+K/GqNdhYcGlWsa8IfwTMnZ3rhKAoG
 WitcW3SA+cxEzVxO9UVL6qMXNrLvLlp3KnAElRJPf4d9Pxajj1mgD2odxTHmlE+WRMmO
 d1YdU8OprMkjABRHKyHQf+htUE2bx8pRLfUvqLk4QtdIlbNeWIK7iUxiXX2dynUAPr1f
 tJlaAgNKglMS6DxaRbmvZx9cFR40bLGKM96t7N+HNz0e9PRQU4Dc4L/yd0p1I4gJ6wU4
 aYgg==
X-Gm-Message-State: APjAAAV5PqppLLo67ljtOHVjBYvviXYFib+Q66nPtdtUQpx5WJwdPci6
 JKNjodhbFe9BVcWh/+9katLtuzig6PIMFr4Wz9wGIPMn
X-Google-Smtp-Source: APXvYqzFTJ4mt7FO9CGpIlzAKf9HhYETdklvKeSRx9Ei29wI+HmIHSXXAInIGH7J0Q8jjiw6cEqqJ7Z2zeSJRc9b4MA=
X-Received: by 2002:a0d:e184:: with SMTP id
 k126mr13873398ywe.253.1561982405523; 
 Mon, 01 Jul 2019 05:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAB5c7xr4d8oiKoeL3wYCcH860RTP3LY_FYTsBGC--ukGRiTa5A@mail.gmail.com>
 <20190517054426.aoyovsk4cwsse2li@inti>
 <CAB5c7xofY0NQMrf_UX36JHDucoN5f-N-HdPvXis3PXMRbSEQpw@mail.gmail.com>
 <764e0998-97b3-c47d-bbc7-73c8f748d58d@samba.org>
 <20190529170249.GA12186@samba.org>
In-Reply-To: <20190529170249.GA12186@samba.org>
Date: Mon, 1 Jul 2019 07:59:53 -0400
Message-ID: <CAB5c7xojRQCRR3S9WSGa1LiWSPAvbnS2kQLhkaka_sE5=CXSqQ@mail.gmail.com>
Subject: Re: [PATCH] zfsacl: Fix ACL behavior issues with vfs_zfsacl
To: samba-technical@lists.samba.org
Content-Type: multipart/mixed; boundary="0000000000006d871f058c9d5ef2"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--0000000000006d871f058c9d5ef2
Content-Type: text/plain; charset="UTF-8"

Per Ralph's request, I am breaking the issues into separate patches. This
is the first patch. It sets SEC_DESC_DACL_PROTECTED if the ZFS ACL lacks
any entries with the INHERITED flag set. ZFS has the PROTECTED ACL flag,
but mapping inside zfsacl is not possible because the flag in solaris /
illumos is not exposed by the acl() syscall (although it is used by the
kernel SMB server). In FreeBSD, the ACL flags are not mapped at all. I have
a WIP patch for freebsd to expose them via acl_get_file() and
acl_set_file(). This means that eventually I will submit a freebsd-specific
vfs module to do this properly.

This behavior (being able to map SEC_DESC_DACL_PROTECTED to something)
appears to be required for proper Windows client behavior when trying to
alter an existing ACL. Windows Explorer will simply not allow users to edit
an ACL if inheritance is not disabled. Unfortunately, it does not appear to
evaluate the actual ACE inheritance flags to see if they are inherited, but
rather at the security descriptor type bits. The end result is that it is
impossible to use Windows explorer to edit the ACL of files in a Samba
share with zfsacl unless this parameter is set.

Andrew

On Wed, May 29, 2019 at 1:02 PM Christof Schmitt <cs@samba.org> wrote:

> On Mon, May 27, 2019 at 11:34:17AM +0200, Ralph Boehme wrote:
> > Hi Andrew,
> >
> > On 5/20/19 1:00 PM, Andrew Walker via samba-technical wrote:
> >  > Thanks for the feedback and suggestions. I'll try to get this done
> this
> > > week or next week. You are correct that ZFS has the  NFSv4.1 ACL
> flags, but
> > > FreeBSD does not currently implement NFSv4.1 ACL inheritance. The
> > > suggestion of just mapping what we receive over the wire is a good
> one. I
> > > could probably do this for the case of Solaris and Illumos.
> > >
> > > One possible alternative is that I could move this logic/lies to
> libsunacl
> > > (the library that maps ZFS ACLs to FreeBSD ACLs) so that there won't
> be a
> > > FreeBSD-specific parameter for vfs_zfsacl. In this case the only thing
> I
> > > would need to add to fix disabling inheritance in samba is mapping the
> > > NFSv4.1 ACL flags to control flags like gpfs does.
> > >
> > > Let me know if you prefer the second approach.
> >
> > Not sure if I like either of both. :)
> >
> > Iirc the protected flag only comes to play client side, when Windows
> > Explorer performs tree inheritance for new created ACEs. My NT ACL mind
> > model is currently swapped out and not fully swapped back in, so I might
> > be missing something. Jeremy?
> >
> > So basically the only thing you need to implement this in the filesystem
> > is storing the flag, no need to attach any semantics to it in the
> > filesystem. The chmod command could be updated to honor the flag when
> > appyling ACL changes in directory tree mode, not sure if how GPFS
> > handles this.
> >
> > Christof do you know? I guess chmod on GPFS will ignore the protected
> flag.
>
> Is that the SEC_DESC_DACL_PROTECTED flag? For GPFS, gets mapped to
> the ACL flag and stored in the file system ACL. There is no behavior
> attached to that flag.
>
> chmod in vfs_gpfs does not check the PROTECTED flag. We probably could
> add additional logic if necessary.
>
> Christof
>

--0000000000006d871f058c9d5ef2
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-Fix-issue-with-ACL-inheritance-in-zfsacl.patch"
Content-Disposition: attachment; 
	filename="0001-Fix-issue-with-ACL-inheritance-in-zfsacl.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jxkbyzbr0>
X-Attachment-Id: f_jxkbyzbr0

RnJvbSAwZTc5ZTI3ZGRkZDNmNjA5MjNmYzI4MjAxNTc4MmFhMWI0MTE3YWMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBhd2Fsa2VyIDxhd2Fsa2VyQGl4c3lzdGVtcy5jb20+CkRhdGU6
IFNhdCwgMTEgTWF5IDIwMTkgMTU6MDA6MTggLTA0MDAKU3ViamVjdDogW1BBVENIXSBGaXggaXNz
dWUgd2l0aCBBQ0wgaW5oZXJpdGFuY2UgaW4gemZzYWNsIEZpeCBpc3N1ZSBwcmV2ZW50aW5nCiBX
aW5kb3dzIENsaWVudHMgZnJvbSBkaXNhYmxpbmcgaW5oZXJpdGFuY2Ugb24gQUNMcyBieSBpbnRy
b2R1Y2luZyBuZXcKIHBhcmFtZXRlciAobWFwX2RhY2xfcHJvdGVjdGVkKSB0aGF0IHNldHMgU0VD
X0RFU0NfREFDTF9QUk9URUNURUQgaWYgbm8gQUNFcwogaW4gdGhlIEFDTCBhcmUgaW5oZXJpdGVk
LgoKLS0tCiBkb2NzLXhtbC9tYW5wYWdlcy92ZnNfemZzYWNsLjgueG1sIHwgMTcgKysrKysrKwog
c291cmNlMy9tb2R1bGVzL3Zmc196ZnNhY2wuYyAgICAgICB8IDk0ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDEwNCBpbnNlcnRpb25zKCsp
LCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RvY3MteG1sL21hbnBhZ2VzL3Zmc196ZnNh
Y2wuOC54bWwgYi9kb2NzLXhtbC9tYW5wYWdlcy92ZnNfemZzYWNsLjgueG1sCmluZGV4IDQ4Mjdl
MjQuLjY2NGNjNTEgMTAwNjQ0Ci0tLSBhL2RvY3MteG1sL21hbnBhZ2VzL3Zmc196ZnNhY2wuOC54
bWwKKysrIGIvZG9jcy14bWwvbWFucGFnZXMvdmZzX3pmc2FjbC44LnhtbApAQCAtMTI1LDYgKzEy
NSwyMyBAQAogCQk8L2xpc3RpdGVtPgogCQk8L3Zhcmxpc3RlbnRyeT4KIAorCQk8dmFybGlzdGVu
dHJ5PgorCQk8dGVybT56ZnNhY2w6bWFwX2RhY2xfcHJvdGVjdGVkID0gW3llc3xub108L3Rlcm0+
CisJCTxsaXN0aXRlbT4KKwkJPHBhcmE+SWYgZW5hYmxlZCBhbmQgdGhlIFpGUyBBQ0wgb24gdGhl
IHVuZGVybHlpbmcgZmlsZXN5c3RlbSBkb2VzIG5vdCBjb250YWluIAorCQlhbnkgaW5oZXJpdGVk
IEFjY2VzcyBDb250cm9sIEVudGlyZXMsIHRoZW4gc2V0IHRoZSBTRUNfREVTQ19EQUNMX1BST1RF
Q1RFRCBmbGFnLiAKKwkJb24gdGhlIFNlY3VyaXR5IERlc2NyaXB0b3IgcmV0dXJuZWQgdG8gU01C
IGNsaWVudHMgZnJvbSBjYWxscyB0byBnZXRfbnRfYWNsLiAKKwkJVGhpcyBlbnN1cmVzIGNvcnJl
Y3QgV2luZG93cyBjbGllbnQgYmVoYXZpb3Igd2hlbiBkaXNhYmxpbmcgaW5oZXJpdGFuY2Ugb24g
CisJCWRpcmVjdG9yaWVzLjwvcGFyYT4KKworCQk8cGFyYT5Gb2xsb3dpbmcgaXMgdGhlIGJlaGF2
aW91ciBvZiBTYW1iYSBmb3IgZGlmZmVyZW50IHZhbHVlcyA6IDwvcGFyYT4KKwkJPGl0ZW1pemVk
bGlzdD4KKwkJPGxpc3RpdGVtPjxwYXJhPjxjb21tYW5kPnllczwvY29tbWFuZD4gLSBFbmFibGUg
bWFwcGluZyB0byBTRUNfREVTQ19EQUNMX1BST1RFQ1RFRDwvcGFyYT48L2xpc3RpdGVtPgorCQk8
bGlzdGl0ZW0+PHBhcmE+PGNvbW1hbmQ+bm8gKGRlZmF1bHQpPC9jb21tYW5kPiAtIERpc2FibGUg
bWFwcGluZyB0byBTRUNfREVTQ19EQUNMX1BST1RFQ1RFRDwvcGFyYT48L2xpc3RpdGVtPgorCQk8
L2l0ZW1pemVkbGlzdD4KKwkJPC9saXN0aXRlbT4KKwkJPC92YXJsaXN0ZW50cnk+CisKIAk8L3Zh
cmlhYmxlbGlzdD4KIDwvcmVmc2VjdDE+CiAKZGlmZiAtLWdpdCBhL3NvdXJjZTMvbW9kdWxlcy92
ZnNfemZzYWNsLmMgYi9zb3VyY2UzL21vZHVsZXMvdmZzX3pmc2FjbC5jCmluZGV4IDJjNWQ4MmEu
Ljc5OTI0ZTYgMTAwNjQ0Ci0tLSBhL3NvdXJjZTMvbW9kdWxlcy92ZnNfemZzYWNsLmMKKysrIGIv
c291cmNlMy9tb2R1bGVzL3Zmc196ZnNhY2wuYwpAQCAtMzYsNiArMzYsMTIgQEAKIAogI2RlZmlu
ZSBaRlNBQ0xfTU9EVUxFX05BTUUgInpmc2FjbCIKIAorc3RydWN0IHpmc2FjbF9jb25maWdfZGF0
YSB7CisJc3RydWN0IHNtYmFjbDRfdmZzX3BhcmFtcyBuZnM0X3BhcmFtczsKKwlib29sIHpmc2Fj
bF9tYXBfZGFjbF9wcm90ZWN0ZWQ7CisJYm9vbCB6ZnNhY2xfZGVueW1pc3NpbmdzcGVjaWFsOwor
fTsKKwogLyogemZzX2dldF9udF9hY2woKQogICogcmVhZCB0aGUgbG9jYWwgZmlsZSdzIGFjbHMg
YW5kIHJldHVybiBpdCBpbiBOVCBmb3JtCiAgKiB1c2luZyB0aGUgTkZTdjQgZm9ybWF0IGNvbnZl
cnNpb24KQEAgLTQzLDcgKzQ5LDggQEAKIHN0YXRpYyBOVFNUQVRVUyB6ZnNfZ2V0X250X2FjbF9j
b21tb24oc3RydWN0IGNvbm5lY3Rpb25fc3RydWN0ICpjb25uLAogCQkJCSAgICAgIFRBTExPQ19D
VFggKm1lbV9jdHgsCiAJCQkJICAgICAgY29uc3Qgc3RydWN0IHNtYl9maWxlbmFtZSAqc21iX2Zu
YW1lLAotCQkJCSAgICAgIHN0cnVjdCBTTUI0QUNMX1QgKipwcGFjbCkKKwkJCQkgICAgICBzdHJ1
Y3QgU01CNEFDTF9UICoqcHBhY2wsCisJCQkJICAgICAgc3RydWN0IHpmc2FjbF9jb25maWdfZGF0
YSAqY29uZmlnKQogewogCWludCBuYWNlcywgaTsKIAlhY2VfdCAqYWNlYnVmOwpAQCAtNTEsNiAr
NTgsNyBAQCBzdGF0aWMgTlRTVEFUVVMgemZzX2dldF9udF9hY2xfY29tbW9uKHN0cnVjdCBjb25u
ZWN0aW9uX3N0cnVjdCAqY29ubiwKIAlTTUJfU1RSVUNUX1NUQVQgc2J1ZjsKIAljb25zdCBTTUJf
U1RSVUNUX1NUQVQgKnBzYnVmID0gTlVMTDsKIAlpbnQgcmV0OworCWJvb2wgaW5oZXJpdGVkX2lz
X3ByZXNlbnQgPSBGYWxzZTsKIAlib29sIGlzX2RpcjsKIAogCWlmIChWQUxJRF9TVEFUKHNtYl9m
bmFtZS0+c3QpKSB7CkBAIC0xMTcsNiArMTI1LDExIEBAIHN0YXRpYyBOVFNUQVRVUyB6ZnNfZ2V0
X250X2FjbF9jb21tb24oc3RydWN0IGNvbm5lY3Rpb25fc3RydWN0ICpjb25uLAogCQkJYWNlcHJv
cC5hY2VNYXNrIHw9IFNNQl9BQ0U0X0RFTEVURV9DSElMRDsKIAkJfQogCisjaWZkZWYgQUNFX0lO
SEVSSVRFRF9BQ0UKKyAJCWlmKGFjZXByb3AuYWNlRmxhZ3MgJiBBQ0VfSU5IRVJJVEVEX0FDRSkg
eworIAkJCWluaGVyaXRlZF9pc19wcmVzZW50ID0gdHJ1ZTsKKyAJCX0KKyNlbmRpZgogCQlpZihh
Y2Vwcm9wLmFjZUZsYWdzICYgQUNFX09XTkVSKSB7CiAJCQlhY2Vwcm9wLmZsYWdzID0gU01CX0FD
RTRfSURfU1BFQ0lBTDsKIAkJCWFjZXByb3Aud2hvLnNwZWNpYWxfaWQgPSBTTUJfQUNFNF9XSE9f
T1dORVI7CkBAIC0xMzMsNiArMTQ2LDEyIEBAIHN0YXRpYyBOVFNUQVRVUyB6ZnNfZ2V0X250X2Fj
bF9jb21tb24oc3RydWN0IGNvbm5lY3Rpb25fc3RydWN0ICpjb25uLAogCQkJcmV0dXJuIE5UX1NU
QVRVU19OT19NRU1PUlk7CiAJfQogCisjaWZkZWYgQUNFX0lOSEVSSVRFRF9BQ0UKKyAJaWYgKCFp
bmhlcml0ZWRfaXNfcHJlc2VudCAmJiBjb25maWctPnpmc2FjbF9tYXBfZGFjbF9wcm90ZWN0ZWQp
IHsKKwkJREJHX0RFQlVHKCJzZXR0aW5nIGRhY2xfcHJvdGVjdGVkIGZsYWcgb24gJXMgXG4iLCBz
bWJfZm5hbWUtPmJhc2VfbmFtZSk7CisJCXNtYmFjbDRfc2V0X2NvbnRyb2xmbGFncyhwYWNsLCBT
RUNfREVTQ19EQUNMX1BST1RFQ1RFRHxTRUNfREVTQ19TRUxGX1JFTEFUSVZFKTsKKwl9CisjZW5k
aWYKIAkqcHBhY2wgPSBwYWNsOwogCXJldHVybiBOVF9TVEFUVVNfT0s7CiB9CkBAIC0xNDYsNiAr
MTY1LDEyIEBAIHN0YXRpYyBib29sIHpmc19wcm9jZXNzX3NtYmFjbCh2ZnNfaGFuZGxlX3N0cnVj
dCAqaGFuZGxlLCBmaWxlc19zdHJ1Y3QgKmZzcCwKIAlzdHJ1Y3QgU01CNEFDRV9UICpzbWJhY2U7
CiAJVEFMTE9DX0NUWAkqbWVtX2N0eDsKIAlib29sIGhhdmVfc3BlY2lhbF9pZCA9IGZhbHNlOwor
CXN0cnVjdCB6ZnNhY2xfY29uZmlnX2RhdGEgKmNvbmZpZzsKKworCVNNQl9WRlNfSEFORExFX0dF
VF9EQVRBKGhhbmRsZSwgY29uZmlnLAorCQkJCXN0cnVjdCB6ZnNhY2xfY29uZmlnX2RhdGEsCisJ
CQkJcmV0dXJuIEZhbHNlKTsKKwogCiAJLyogYWxsb2NhdGUgdGhlIGZpZWxkIG9mIFpGUyBhY2Vz
ICovCiAJbWVtX2N0eCA9IHRhbGxvY190b3MoKTsKQEAgLTE4Nyw5ICsyMTIsNyBAQCBzdGF0aWMg
Ym9vbCB6ZnNfcHJvY2Vzc19zbWJhY2wodmZzX2hhbmRsZV9zdHJ1Y3QgKmhhbmRsZSwgZmlsZXNf
c3RydWN0ICpmc3AsCiAJCX0KIAl9CiAKLQlpZiAoIWhhdmVfc3BlY2lhbF9pZAotCSAgICAmJiBs
cF9wYXJtX2Jvb2woZnNwLT5jb25uLT5wYXJhbXMtPnNlcnZpY2UsICJ6ZnNhY2wiLAotCQkJICAg
ICJkZW55bWlzc2luZ3NwZWNpYWwiLCBmYWxzZSkpIHsKKwlpZiAoIWhhdmVfc3BlY2lhbF9pZCAm
JiBjb25maWctPnpmc2FjbF9kZW55bWlzc2luZ3NwZWNpYWwpIHsKIAkJZXJybm8gPSBFQUNDRVM7
CiAJCXJldHVybiBmYWxzZTsKIAl9CkBAIC0yMjAsNyArMjQzLDEzIEBAIHN0YXRpYyBOVFNUQVRV
UyB6ZnNfc2V0X250X2FjbCh2ZnNfaGFuZGxlX3N0cnVjdCAqaGFuZGxlLCBmaWxlc19zdHJ1Y3Qg
KmZzcCwKIAkJCSAgIHVpbnQzMl90IHNlY3VyaXR5X2luZm9fc2VudCwKIAkJCSAgIGNvbnN0IHN0
cnVjdCBzZWN1cml0eV9kZXNjcmlwdG9yICpwc2QpCiB7Ci0gICAgICAgIHJldHVybiBzbWJfc2V0
X250X2FjbF9uZnM0KGhhbmRsZSwgZnNwLCBOVUxMLCBzZWN1cml0eV9pbmZvX3NlbnQsIHBzZCwK
KwlzdHJ1Y3QgemZzYWNsX2NvbmZpZ19kYXRhICpjb25maWc7CisKKwlTTUJfVkZTX0hBTkRMRV9H
RVRfREFUQShoYW5kbGUsIGNvbmZpZywKKwkJCQlzdHJ1Y3QgemZzYWNsX2NvbmZpZ19kYXRhLAor
CQkJCXJldHVybiBOVF9TVEFUVVNfSU5URVJOQUxfRVJST1IpOworCisgICAgICAgIHJldHVybiBz
bWJfc2V0X250X2FjbF9uZnM0KGhhbmRsZSwgZnNwLCAmY29uZmlnLT5uZnM0X3BhcmFtcywgc2Vj
dXJpdHlfaW5mb19zZW50LCBwc2QsCiAJCQkJICAgemZzX3Byb2Nlc3Nfc21iYWNsKTsKIH0KIApA
QCAtMjMyLDEwICsyNjEsMTUgQEAgc3RhdGljIE5UU1RBVFVTIHpmc2FjbF9mZ2V0X250X2FjbChz
dHJ1Y3QgdmZzX2hhbmRsZV9zdHJ1Y3QgKmhhbmRsZSwKIHsKIAlzdHJ1Y3QgU01CNEFDTF9UICpw
YWNsOwogCU5UU1RBVFVTIHN0YXR1czsKKwlzdHJ1Y3QgemZzYWNsX2NvbmZpZ19kYXRhICpjb25m
aWc7CisJU01CX1ZGU19IQU5ETEVfR0VUX0RBVEEoaGFuZGxlLCBjb25maWcsCisJCQkJc3RydWN0
IHpmc2FjbF9jb25maWdfZGF0YSwKKwkJCQlyZXR1cm4gTlRfU1RBVFVTX0lOVEVSTkFMX0VSUk9S
KTsKKwogCVRBTExPQ19DVFggKmZyYW1lID0gdGFsbG9jX3N0YWNrZnJhbWUoKTsKIAogCXN0YXR1
cyA9IHpmc19nZXRfbnRfYWNsX2NvbW1vbihoYW5kbGUtPmNvbm4sIGZyYW1lLAotCQkJCSAgICAg
ICBmc3AtPmZzcF9uYW1lLCAmcGFjbCk7CisJCQkJICAgICAgIGZzcC0+ZnNwX25hbWUsICZwYWNs
LCBjb25maWcpOwogCWlmICghTlRfU1RBVFVTX0lTX09LKHN0YXR1cykpIHsKIAkJVEFMTE9DX0ZS
RUUoZnJhbWUpOwogCQlpZiAoIU5UX1NUQVRVU19FUVVBTChzdGF0dXMsIE5UX1NUQVRVU19OT1Rf
U1VQUE9SVEVEKSkgewpAQCAtMjY4LDkgKzMwMiwxNCBAQCBzdGF0aWMgTlRTVEFUVVMgemZzYWNs
X2dldF9udF9hY2woc3RydWN0IHZmc19oYW5kbGVfc3RydWN0ICpoYW5kbGUsCiB7CiAJc3RydWN0
IFNNQjRBQ0xfVCAqcGFjbDsKIAlOVFNUQVRVUyBzdGF0dXM7CisJc3RydWN0IHpmc2FjbF9jb25m
aWdfZGF0YSAqY29uZmlnOworCVNNQl9WRlNfSEFORExFX0dFVF9EQVRBKGhhbmRsZSwgY29uZmln
LAorCQkJCXN0cnVjdCB6ZnNhY2xfY29uZmlnX2RhdGEsCisJCQkJcmV0dXJuIE5UX1NUQVRVU19J
TlRFUk5BTF9FUlJPUik7CisKIAlUQUxMT0NfQ1RYICpmcmFtZSA9IHRhbGxvY19zdGFja2ZyYW1l
KCk7CiAKLQlzdGF0dXMgPSB6ZnNfZ2V0X250X2FjbF9jb21tb24oaGFuZGxlLT5jb25uLCBmcmFt
ZSwgc21iX2ZuYW1lLCAmcGFjbCk7CisJc3RhdHVzID0gemZzX2dldF9udF9hY2xfY29tbW9uKGhh
bmRsZS0+Y29ubiwgZnJhbWUsIHNtYl9mbmFtZSwgJnBhY2wsIGNvbmZpZyk7CiAJaWYgKCFOVF9T
VEFUVVNfSVNfT0soc3RhdHVzKSkgewogCQlUQUxMT0NfRlJFRShmcmFtZSk7CiAJCWlmICghTlRf
U1RBVFVTX0VRVUFMKHN0YXR1cywgTlRfU1RBVFVTX05PVF9TVVBQT1JURUQpKSB7CkBAIC0zOTUs
OSArNDM0LDUwIEBAIHN0YXRpYyBpbnQgemZzYWNsX2ZhaWxfX3N5c19hY2xfYmxvYl9nZXRfZmQo
dmZzX2hhbmRsZV9zdHJ1Y3QgKmhhbmRsZSwgZmlsZXNfc3RyCiAJcmV0dXJuIC0xOwogfQogCitz
dGF0aWMgaW50IHpmc2FjbF9jb25uZWN0KHN0cnVjdCB2ZnNfaGFuZGxlX3N0cnVjdCAqaGFuZGxl
LAorCQkJICAgIGNvbnN0IGNoYXIgKnNlcnZpY2UsIGNvbnN0IGNoYXIgKnVzZXIpCit7CisJc3Ry
dWN0IHpmc2FjbF9jb25maWdfZGF0YSAqY29uZmlnOworCWludCByZXQ7CisJY29uc3QgY2hhciAq
aG9tZWRpcl9xdW90YSA9IE5VTEw7CisJY29uc3QgY2hhciAqYmFzZV9xdW90YV9zdHIgPSBOVUxM
OworCisJY29uZmlnID0gdGFsbG9jX3plcm8oaGFuZGxlLT5jb25uLCBzdHJ1Y3QgemZzYWNsX2Nv
bmZpZ19kYXRhKTsKKwlpZiAoIWNvbmZpZykgeworCQlERUJVRygwLCAoInRhbGxvY196ZXJvKCkg
ZmFpbGVkXG4iKSk7CisJCWVycm5vID0gRU5PTUVNOworCQlyZXR1cm4gLTE7CisJfQkKKworCWNv
bmZpZy0+emZzYWNsX21hcF9kYWNsX3Byb3RlY3RlZCA9IGxwX3Bhcm1fYm9vbChTTlVNKGhhbmRs
ZS0+Y29ubiksCisJCQkJInpmc2FjbCIsICJtYXBfZGFjbF9wcm90ZWN0ZWQiLCBmYWxzZSk7CisK
Kwljb25maWctPnpmc2FjbF9kZW55bWlzc2luZ3NwZWNpYWwgPSBscF9wYXJtX2Jvb2woU05VTSho
YW5kbGUtPmNvbm4pLAorCQkJCSJ6ZnNhY2wiLCAiZGVueW1pc3NpbmdzcGVjaWFsIiwgZmFsc2Up
OworCisJcmV0ID0gU01CX1ZGU19ORVhUX0NPTk5FQ1QoaGFuZGxlLCBzZXJ2aWNlLCB1c2VyKTsK
KwlpZiAocmV0IDwgMCkgeworCQlUQUxMT0NfRlJFRShjb25maWcpOworCQlyZXR1cm4gcmV0Owor
CX0KKworCXJldCA9IHNtYmFjbDRfZ2V0X3Zmc19wYXJhbXMoaGFuZGxlLT5jb25uLCAmY29uZmln
LT5uZnM0X3BhcmFtcyk7CisJaWYgKHJldCA8IDApIHsKKwkJVEFMTE9DX0ZSRUUoY29uZmlnKTsK
KwkJcmV0dXJuIHJldDsKKwl9CisKKwlTTUJfVkZTX0hBTkRMRV9TRVRfREFUQShoYW5kbGUsIGNv
bmZpZywKKwkJCQlOVUxMLCBzdHJ1Y3QgemZzYWNsX2NvbmZpZ19kYXRhLAorCQkJCXJldHVybiAt
MSk7CisKKwlyZXR1cm4gMDsKK30KKwogLyogVkZTIG9wZXJhdGlvbnMgc3RydWN0dXJlICovCiAK
IHN0YXRpYyBzdHJ1Y3QgdmZzX2ZuX3BvaW50ZXJzIHpmc2FjbF9mbnMgPSB7CisJLmNvbm5lY3Rf
Zm4gPSB6ZnNhY2xfY29ubmVjdCwKIAkuc3lzX2FjbF9nZXRfZmlsZV9mbiA9IHpmc2FjbF9mYWls
X19zeXNfYWNsX2dldF9maWxlLAogCS5zeXNfYWNsX2dldF9mZF9mbiA9IHpmc2FjbF9mYWlsX19z
eXNfYWNsX2dldF9mZCwKIAkuc3lzX2FjbF9ibG9iX2dldF9maWxlX2ZuID0gemZzYWNsX2ZhaWxf
X3N5c19hY2xfYmxvYl9nZXRfZmlsZSwKLS0gCjEuOC4zLjEKCg==
--0000000000006d871f058c9d5ef2--

