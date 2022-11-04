Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CD061922C
	for <lists+samba-technical@lfdr.de>; Fri,  4 Nov 2022 08:49:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Om2TyDahfnD83I3Qo+qQQBBeOrmRwVftbWcvTXtVP1Q=; b=jdwWP5Q2V21NN/V6BjJteb6nfj
	uADvWFImCibMFpzWdmpLfv0sQr5VUfyR4hk59O0mpjL55gFsay2MGQDBcrEwdt1IUdskNjDXlATrC
	pu8qMNcJUTFhsThyv3P7xd65epw4m+0AGlzueQDBmFDAu7CrdIelu46FZFYcotNnfpBqq1VsygiEw
	Wezy86WACfXptDcaRlmJdTgddhph1VEjHpocWb/zjovpMz9LeF6ebLDvfOMSS/73DpLykuwYTd/uu
	M5V2HOEWg3WhuPrKjWCz92iRFSBCBkidVyOac5OVNMi8NDtWEgEXLCMEPEa1C7lpQF6a5GZmkJm6u
	4iykceLg==;
Received: from ip6-localhost ([::1]:52772 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oqrR7-00Abgj-6m; Fri, 04 Nov 2022 07:48:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36354) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1oqrQr-00Abga-2Z
 for samba-technical@lists.samba.org; Fri, 04 Nov 2022 07:48:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667548081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Om2TyDahfnD83I3Qo+qQQBBeOrmRwVftbWcvTXtVP1Q=;
 b=Hk5oBi4Ke7u0FbcT5VlqpUglSK27E14r3vOvtb9Y/g1PJiqO+0ZeDrSi7CrdWWlQ7F72Yz
 VuU3HZ1zOtJHmazcw5PtUJPPmlAciJensp5shnUSmt9lHskY8sZQSDQ+wQ43RQAHhpvqHi
 VwlgrNZt5f44pbFFQ2XfcjkN6cv8exw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667548081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Om2TyDahfnD83I3Qo+qQQBBeOrmRwVftbWcvTXtVP1Q=;
 b=Hk5oBi4Ke7u0FbcT5VlqpUglSK27E14r3vOvtb9Y/g1PJiqO+0ZeDrSi7CrdWWlQ7F72Yz
 VuU3HZ1zOtJHmazcw5PtUJPPmlAciJensp5shnUSmt9lHskY8sZQSDQ+wQ43RQAHhpvqHi
 VwlgrNZt5f44pbFFQ2XfcjkN6cv8exw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-nuterBbhM7y4e6FNJTNrEQ-1; Fri, 04 Nov 2022 03:31:02 -0400
X-MC-Unique: nuterBbhM7y4e6FNJTNrEQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2C441C0512B;
 Fri,  4 Nov 2022 07:31:01 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.2.16.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C8F8418EB4;
 Fri,  4 Nov 2022 07:31:00 +0000 (UTC)
To: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Subject: Re: vfswrap_getxattrat_do_async and unshare(CLONE_FS)
References: <87czag28up.fsf@oldenburg.str.redhat.com>
 <Y1cOvCrfk4QEaE4m@jeremy-acer>
 <721dd560-87f9-5f26-be88-0974fb520554@samba.org>
Date: Fri, 04 Nov 2022 08:30:59 +0100
In-Reply-To: <721dd560-87f9-5f26-be88-0974fb520554@samba.org> (Stefan
 Metzmacher via samba-technical's message of "Sat, 29 Oct 2022 12:28:58
 +0200")
Message-ID: <87wn8b18i4.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
From: Florian Weimer via samba-technical <samba-technical@lists.samba.org>
Reply-To: Florian Weimer <fweimer@redhat.com>
Cc: Stefan Metzmacher <metze@samba.org>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

* Stefan Metzmacher via samba-technical:

> Hi Florian,
>
>> On Mon, Oct 24, 2022 at 11:46:22PM +0200, Florian Weimer via samba-techn=
ical wrote:
>>> As far as I can tell, vfswrap_getxattrat_do_async relies on
>>> unshare(CLONE_FS) to do fgetxattrat emulation with a thread-local fchdi=
r
>>> and getxattr.=C2=A0 There do not seem to be any other uses in the sourc=
es.
>>>
>>> I think the more usual way to emulate the missing fgetxattrat system
>>> call is to open the file with openat and O_PATH, and then use getxattr
>>> on the synthetic path under /proc/self/fd.=C2=A0 While these paths pres=
ent as
>>> symbolic links, they actually are not, so there is no race possible.
>>> (fgetxattr cannot operate on the open file descriptor directly.)
>>>
>>> Why wasn't the /proc-based approach chosen for Samba?=C2=A0 It looks a =
bit
>>> simpler to implement, and does not do strange things to the process
>>> state behind glibc's back.
>> As I recall it was done that way as there are various OEMs with
>> fuse-based
>> filesystems that are very slow on fetching EA's, which we have to do
>> on every directory entry returned. Doing this inside a pthread using
>> unshare(CLONE_FS) to keep a per-thread directory was found to allow
>> these filesystems to have a decent performance.
>
> Yes, open/getxattr/close for each directory element was avoided
> for performance reasons at the time we developed it.
>
>> This was before the VFS-rewrite to use fd's everywhere as I recall,
>> so it's possible it may no longer be required. But I'd wait for
>> Metze to chime in here as he was deeply involved in this I think.
>
> Yes, looking the current code shows that
> vfswrap_getxattrat_do_async already uses vfswrap_fgetxattr(),
> which is fd-based and actually uses /proc/self/fd if
> fsp->fsp_flags.have_proc_fds is set, and that is never
> false if per_thread_cwd_supported() is true.
>
> So I think could replace per_thread_cwd_supported() in
> vfswrap_getxattrat_send() with fsp->fsp_flags.have_proc_fds
> and actually remove per_thread_cwd_activate() and set_thread_credentials(=
)
> from vfswrap_getxattrat_do_async(). This would also mean we can
> also go async within restricted
> containers which block the whole unshare() syscall (independed of the pas=
sed flags).

Thanks for the explanation.

The reference to blocking unshare() is interesting, I had not considered
this.  If we integrate CLONE_FS supported into glibc's pthread_create,
this issue goes away.

In the meantime, I'm going to ask other projects if they need
CLONE_FS. 8-)

Thanks,
Florian


