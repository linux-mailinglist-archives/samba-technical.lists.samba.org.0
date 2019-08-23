Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D4A9AB3F
	for <lists+samba-technical@lfdr.de>; Fri, 23 Aug 2019 11:22:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=OnjoCJD2DTGnAC776dopUVZmMQWUkxXTnVGRewmZurw=; b=ackChdMOoReI6lPxHQubdAWBor
	y9YF4l55vpEfWKytgs+TNfdWvEIUv7964KGvZ3TRGtiv+SsgwKAuGhYEATdOrp00w+PAQVUrIBUMM
	IHDfXYgyB0Iy4/gARrDDOeIizKY3GOZilFTmtN6lw0wcGVYNndGl592Uo2KtlUVvU/dZC7BVBF/8p
	c7G2FXiDtVXaDMru4nZpIP7d9bNLa5kROmEt/flV6rMBjcEFhAdLr2X8UU6DEZL9UfRoxKnvdYPrQ
	jHeILu+pvSP7O3yAPe4KBc4Bfk7uibwE6dpwSHGAM+BmpwkQxBu7vnoN0W5jFV3QJVxaLJuF4O9ql
	rm9f/wLA==;
Received: from localhost ([::1]:24814 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i15lY-007m19-Si; Fri, 23 Aug 2019 09:21:52 +0000
Received: from confino.investici.org ([212.103.72.250]:47151) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i15lT-007m12-68
 for samba-technical@lists.samba.org; Fri, 23 Aug 2019 09:21:50 +0000
Received: from mx1.investici.org (localhost [127.0.0.1])
 by confino.investici.org (Postfix) with ESMTP id 6985B20F69;
 Fri, 23 Aug 2019 09:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cryptolab.net;
 s=stigmate; t=1566552095;
 bh=OnjoCJD2DTGnAC776dopUVZmMQWUkxXTnVGRewmZurw=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=MTegEZ/voEYU0oYVLPc72JNswVQzrREl+HX5QTluWwz5OWCitcUsr/62f2kxn1Yli
 iO2GHg+9PsVmG2OiANmTlGdP9deyIPFfKp1W6zd+H/4seA5yx0uMOi/PmwW2m+4KY4
 h/xc/QEWKln264BvAcV4SqfbMBD6tEyTjK2SPc1I=
Received: from [212.103.72.250] (mx1.investici.org [212.103.72.250])
 (Authenticated sender: anoopcs@autistici.org) by localhost (Postfix) with
 ESMTPSA id EB73320F65; Fri, 23 Aug 2019 09:21:26 +0000 (UTC)
Message-ID: <29996c14096f5852ad3051524767ac26fae9df9c.camel@cryptolab.net>
Subject: Re: [PATCH] Use pthreadpool for aio scheduling in vfs_glusterfs
To: Jeremy Allison <jra@samba.org>
Date: Fri, 23 Aug 2019 14:51:09 +0530
In-Reply-To: <20190822235158.GB253700@jra4>
References: <dbaed65e1d71d7cf5da358359f2f071204a2a8a0.camel@cryptolab.net>
 <5120a5d92b02176052c2fd7cd021c2014a87758e.camel@cryptolab.net>
 <20190822235158.GB253700@jra4>
Content-Type: multipart/mixed; boundary="=-+S9Sh624DE3ZHZvOvSk5"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
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
From: Anoop C S via samba-technical <samba-technical@lists.samba.org>
Reply-To: Anoop C S <anoopcs@cryptolab.net>
Cc: Stefan Metzmacher <metze@samba.org>, obnox <obnox@samba.org>,
 "Volker.Lendecke" <Volker.Lendecke@SerNet.DE>,
 samba-technical <samba-technical@lists.samba.org>, gd <gd@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--=-+S9Sh624DE3ZHZvOvSk5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-08-22 at 16:51 -0700, Jeremy Allison via samba-technical
wrote:
> On Thu, Aug 22, 2019 at 03:46:55PM +0530, Anoop C S wrote:
> > On Thu, 2019-08-22 at 15:43 +0530, Anoop C S via samba-technical
> > wrote:
> > > Hi,
> > > 
> > > Proposing the attached patch to use pthreadpool inside
> > > vfs_glusterfs
> > > to
> > > schedule aio operations which is found to achieve significant
> > > performance boost.
> > 
> > Attaching a new version with BUG id updated in commit message.
> > 
> > > Reviews are appreciated.
> 
> I really like this, and I can see it's modelled after
> Volker's pthread async code in source3/modules/vfs_default.c.
> 
> Having said that I compared the two, and there are just
> a couple of changes I'd like to see.
> 
> 1). Can you add leading definitions of:
> 
> 	static void vfs_gluster_pread_do(void *private_data);
> 	static void vfs_gluster_pread_done(struct tevent_req *subreq);
> 	static int vfs_gluster_pread_state_destructor(struct
> vfswrap_pread_state *state);
> 
> and:
> 
> 	static void vfs_gluster_pwrite_do(void *private_data);
> 	static void vfs_gluster_pwrite_done(struct tevent_req *subreq);
> 	static int vfs_gluster_pwrite_state_destructor(struct
> vfswrap_pwrite_state *state);
> 
> and:
> 
> 	static void vfs_fsync_do(void *private_data);
> 	static void vfs_fsync_done(struct tevent_req *subreq);
> 	static int vfs_fsync_state_destructor(struct
> vfswrap_fsync_state *state);
> 
> and then change the functions code order to be:
> 
> XXX_send()
> XXX_do()
> XXX_destructor()
> XXX_done()
> XXX_recv()
> 
> to match the coding convention for async functions. When
> reading the code it's nice to read downwards through:
> 
> send() -> do() (pthread internal fn). -> destructor() above -> done()
> -> recv()
> 
> as it makes the logic paths of the async code clearer when
> reading through linearly (to me at least).

No worries. I have rearranged accordingly.

> 2). In the source3/modules/vfs_default.c code in pread_done(),
> pwrite_done()
> and fsync_done() we have the blocks:
> 
> 	ret = pthreadpool_tevent_job_recv(subreq);
> 	TALLOC_FREE(subreq);
> 	SMBPROFILE_BYTES_ASYNC_END(state->profile_bytes);
> 	talloc_set_destructor(state, NULL);
> 	if (ret != 0) {
>                 if (ret != EAGAIN) {
>                         tevent_req_error(req, ret);
>                         return;
>                 }
>                 /*
>                  * If we get EAGAIN from
> pthreadpool_tevent_job_recv() this
>                  * means the lower level pthreadpool failed to create
> a new
>                  * thread. Fallback to sync processing in that case
> to allow
>                  * some progress for the client.
>                  */
> 		vfs_[pread/pwrite/fsync]_do()
> 
> and right now you're missing that - looking at the
> pthreadpool library code I think you might need to
> add that logic to ensure you fallback to sync
> if pthread_create() fails with EAGAIN (which it
> can do according to the man page).

Ah.. I think I know why.
This patch was originally prepared out of v4.9 which does not have this
fallback mechanism for async operations. I have added this in updated
patch. 

> If you can do that and resubmit I'd be happy to re-review
> and push !

Please see the attached patch.

> Great work !
> 
> What percentage improvements did you see with these
> changes ?

Performance test was done using single Windows client for random
read/write workload. Following were the percentage increase with
pthreadpool implementation:

create	: ~46%
write	: ~66%
read	: ~26%

> > From 27fd7e8e7fde4b7e478ddc3b247e93cc40c7fd53 Mon Sep 17 00:00:00
> > 2001
> > From: Poornima G <pgurusid@redhat.com>
> > Date: Wed, 24 Jul 2019 15:15:33 +0530
> > Subject: [PATCH] vfs_glusterfs: Use pthreadpool for scheduling aio
> > operations
> > 
> > BUG: https://bugzilla.samba.org/show_bug.cgi?id=14098
> > 
> > Signed-off-by: Poornima G <pgurusid@redhat.com>
> > Reviewed-by: Guenther Deschner <gd@samba.org>
> > ---
> >  source3/modules/vfs_glusterfs.c | 535 ++++++++++++++++----------
> > ------
> >  1 file changed, 260 insertions(+), 275 deletions(-)
> > 
> > diff --git a/source3/modules/vfs_glusterfs.c
> > b/source3/modules/vfs_glusterfs.c
> > index 09299bc70c5..7f63b5d6662 100644
> > --- a/source3/modules/vfs_glusterfs.c
> > +++ b/source3/modules/vfs_glusterfs.c
> > @@ -45,14 +45,11 @@
> >  #include "lib/util/sys_rw.h"
> >  #include "smbprofile.h"
> >  #include "modules/posixacl_xattr.h"
> > +#include "lib/pthreadpool/pthreadpool_tevent.h"
> >  
> >  #define DEFAULT_VOLFILE_SERVER "localhost"
> >  #define GLUSTER_NAME_MAX 255
> >  
> > -static int read_fd = -1;
> > -static int write_fd = -1;
> > -static struct tevent_fd *aio_read_event = NULL;
> > -
> >  /**
> >   * Helper to convert struct stat to struct stat_ex.
> >   */
> > @@ -713,245 +710,211 @@ static ssize_t vfs_gluster_pread(struct
> > vfs_handle_struct *handle,
> >  	return ret;
> >  }
> >  
> > -struct glusterfs_aio_state;
> > -
> > -struct glusterfs_aio_wrapper {
> > -	struct glusterfs_aio_state *state;
> > -};
> > -
> > -struct glusterfs_aio_state {
> > +struct vfs_gluster_pread_state {
> >  	ssize_t ret;
> > -	struct tevent_req *req;
> > -	bool cancelled;
> > +	glfs_fd_t *fd;
> > +	void *buf;
> > +	size_t count;
> > +	off_t offset;
> > +
> >  	struct vfs_aio_state vfs_aio_state;
> > -	struct timespec start;
> >  	SMBPROFILE_BYTES_ASYNC_STATE(profile_bytes);
> >  };
> >  
> > -static int aio_wrapper_destructor(struct glusterfs_aio_wrapper
> > *wrap)
> > +static void vfs_gluster_pread_do(void *private_data)
> >  {
> > -	if (wrap->state != NULL) {
> > -		wrap->state->cancelled = true;
> > -	}
> > +	struct vfs_gluster_pread_state *state = talloc_get_type_abort(
> > +		private_data, struct vfs_gluster_pread_state);
> > +	struct timespec start_time;
> > +	struct timespec end_time;
> >  
> > -	return 0;
> > -}
> > +	SMBPROFILE_BYTES_ASYNC_SET_BUSY(state->profile_bytes);
> >  
> > -/*
> > - * This function is the callback that will be called on glusterfs
> > - * threads once the async IO submitted is complete. To notify
> > - * Samba of the completion we use a pipe based queue.
> > - */
> > +	PROFILE_TIMESTAMP(&start_time);
> > +
> > +	do {
> >  #ifdef HAVE_GFAPI_VER_7_6
> > -static void aio_glusterfs_done(glfs_fd_t *fd, ssize_t ret,
> > -			       struct glfs_stat *prestat,
> > -			       struct glfs_stat *poststat,
> > -			       void *data)
> > +		state->ret = glfs_pread(state->fd, state->buf, state-
> > >count,
> > +					state->offset, 0, NULL);
> >  #else
> > -static void aio_glusterfs_done(glfs_fd_t *fd, ssize_t ret, void
> > *data)
> > +		state->ret = glfs_pread(state->fd, state->buf, state-
> > >count,
> > +					state->offset, 0);
> >  #endif
> > -{
> > -	struct glusterfs_aio_state *state = NULL;
> > -	int sts = 0;
> > -	struct timespec end;
> > -
> > -	state = (struct glusterfs_aio_state *)data;
> > +	} while ((state->ret == -1) && (errno == EINTR));
> >  
> > -	PROFILE_TIMESTAMP(&end);
> > -
> > -	if (ret < 0) {
> > -		state->ret = -1;
> > +	if (state->ret == -1) {
> >  		state->vfs_aio_state.error = errno;
> > -	} else {
> > -		state->ret = ret;
> >  	}
> > -	state->vfs_aio_state.duration = nsec_time_diff(&end, &state-
> > >start);
> >  
> > -	SMBPROFILE_BYTES_ASYNC_END(state->profile_bytes);
> > +	PROFILE_TIMESTAMP(&end_time);
> >  
> > -	/*
> > -	 * Write the state pointer to glusterfs_aio_state to the
> > -	 * pipe, so we can call tevent_req_done() from the main thread,
> > -	 * because tevent_req_done() is not designed to be executed in
> > -	 * the multithread environment, so tevent_req_done() must be
> > -	 * executed from the smbd main thread.
> > -	 *
> > -	 * write(2) on pipes with sizes under _POSIX_PIPE_BUF
> > -	 * in size is atomic, without this, the use op pipes in this
> > -	 * code would not work.
> > -	 *
> > -	 * sys_write is a thin enough wrapper around write(2)
> > -	 * that we can trust it here.
> > -	 */
> > +	state->vfs_aio_state.duration = nsec_time_diff(&end_time,
> > &start_time);
> >  
> > -	sts = sys_write(write_fd, &state, sizeof(struct
> > glusterfs_aio_state *));
> > -	if (sts < 0) {
> > -		DEBUG(0,("\nWrite to pipe failed (%s)",
> > strerror(errno)));
> > -	}
> > -
> > -	return;
> > +	SMBPROFILE_BYTES_ASYNC_SET_IDLE(state->profile_bytes);
> >  }
> >  
> > -/*
> > - * Read each req off the pipe and process it.
> > - */
> > -static void aio_tevent_fd_done(struct tevent_context *event_ctx,
> > -				struct tevent_fd *fde,
> > -				uint16_t flags, void *data)
> > +static int vfs_gluster_pread_state_destructor(struct
> > vfs_gluster_pread_state *state)
> >  {
> > -	struct tevent_req *req = NULL;
> > -	struct glusterfs_aio_state *state = NULL;
> > -	int sts = 0;
> > -
> > -	/*
> > -	 * read(2) on pipes is atomic if the needed data is available
> > -	 * in the pipe, per SUS and POSIX.  Because we always write
> > -	 * to the pipe in sizeof(struct tevent_req *) chunks, we can
> > -	 * always read in those chunks, atomically.
> > -	 *
> > -	 * sys_read is a thin enough wrapper around read(2) that we
> > -	 * can trust it here.
> > -	 */
> > -
> > -	sts = sys_read(read_fd, &state, sizeof(struct
> > glusterfs_aio_state *));
> > +	return -1;
> > +}
> >  
> > -	if (sts < 0) {
> > -		DEBUG(0,("\nRead from pipe failed (%s)",
> > strerror(errno)));
> > -	}
> > +static void vfs_gluster_pread_done(struct tevent_req *subreq)
> > +{
> > +	struct tevent_req *req = tevent_req_callback_data(
> > +		subreq, struct tevent_req);
> > +	struct vfs_gluster_pread_state *state = tevent_req_data(
> > +		req, struct vfs_gluster_pread_state);
> > +	int ret;
> >  
> > -	/* if we've cancelled the op, there is no req, so just clean
> > up. */
> > -	if (state->cancelled == true) {
> > -		TALLOC_FREE(state);
> > +	ret = pthreadpool_tevent_job_recv(subreq);
> > +	TALLOC_FREE(subreq);
> > +	SMBPROFILE_BYTES_ASYNC_END(state->profile_bytes);
> > +	talloc_set_destructor(state, NULL);
> > +	if (tevent_req_error(req, ret)) {
> >  		return;
> >  	}
> >  
> > -	req = state->req;
> > +	tevent_req_done(req);
> > +}
> > +
> > +static ssize_t vfs_gluster_pread_recv(struct tevent_req *req,
> > +				      struct vfs_aio_state
> > *vfs_aio_state)
> > +{
> > +	struct vfs_gluster_pread_state *state = tevent_req_data(
> > +		req, struct vfs_gluster_pread_state);
> >  
> > -	if (req) {
> > -		tevent_req_done(req);
> > +	if (tevent_req_is_unix_error(req, &vfs_aio_state->error)) {
> > +		return -1;
> >  	}
> > -	return;
> > +
> > +	*vfs_aio_state = state->vfs_aio_state;
> > +	return state->ret;
> >  }
> >  
> > -static bool init_gluster_aio(struct vfs_handle_struct *handle)
> > +static struct tevent_req *vfs_gluster_pread_send(struct
> > vfs_handle_struct
> > +						  *handle, TALLOC_CTX
> > *mem_ctx,
> > +						  struct tevent_context
> > *ev,
> > +						  files_struct *fsp,
> > +						  void *data, size_t n,
> > +						  off_t offset)
> >  {
> > -	int fds[2];
> > -	int ret = -1;
> > +	struct vfs_gluster_pread_state *state;
> > +	struct tevent_req *req, *subreq;
> >  
> > -	if (read_fd != -1) {
> > -		/*
> > -		 * Already initialized.
> > -		 */
> > -		return true;
> > +	glfs_fd_t *glfd = vfs_gluster_fetch_glfd(handle, fsp);
> > +	if (glfd == NULL) {
> > +		DBG_ERR("Failed to fetch gluster fd\n");
> > +		return NULL;
> >  	}
> >  
> > -	ret = pipe(fds);
> > -	if (ret == -1) {
> > -		goto fail;
> > +	req = tevent_req_create(mem_ctx, &state, struct
> > vfs_gluster_pread_state);
> > +	if (req == NULL) {
> > +		return NULL;
> >  	}
> >  
> > -	read_fd = fds[0];
> > -	write_fd = fds[1];
> > +	state->ret = -1;
> > +	state->fd = glfd;
> > +	state->buf = data;
> > +	state->count = n;
> > +	state->offset = offset;
> >  
> > -	aio_read_event = tevent_add_fd(handle->conn->sconn->ev_ctx,
> > -					NULL,
> > -					read_fd,
> > -					TEVENT_FD_READ,
> > -					aio_tevent_fd_done,
> > -					NULL);
> > -	if (aio_read_event == NULL) {
> > -		goto fail;
> > -	}
> > +	SMBPROFILE_BYTES_ASYNC_START(syscall_asys_pread, profile_p,
> > +				     state->profile_bytes, n);
> > +	SMBPROFILE_BYTES_ASYNC_SET_IDLE(state->profile_bytes);
> >  
> > -	return true;
> > -fail:
> > -	TALLOC_FREE(aio_read_event);
> > -	if (read_fd != -1) {
> > -		close(read_fd);
> > -		close(write_fd);
> > -		read_fd = -1;
> > -		write_fd = -1;
> > +	subreq = pthreadpool_tevent_job_send(
> > +		state, ev, handle->conn->sconn->pool,
> > +		vfs_gluster_pread_do, state);
> > +	if (tevent_req_nomem(subreq, req)) {
> > +		return tevent_req_post(req, ev);
> >  	}
> > -	return false;
> > +	tevent_req_set_callback(subreq, vfs_gluster_pread_done, req);
> > +
> > +	talloc_set_destructor(state,
> > vfs_gluster_pread_state_destructor);
> > +
> > +	return req;
> >  }
> >  
> > -static struct glusterfs_aio_state *aio_state_create(TALLOC_CTX
> > *mem_ctx)
> > +struct vfs_gluster_pwrite_state {
> > +	ssize_t ret;
> > +	glfs_fd_t *fd;
> > +	const void *buf;
> > +	size_t count;
> > +	off_t offset;
> > +
> > +	struct vfs_aio_state vfs_aio_state;
> > +	SMBPROFILE_BYTES_ASYNC_STATE(profile_bytes);
> > +};
> > +
> > +static void vfs_gluster_pwrite_do(void *private_data)
> >  {
> > -	struct tevent_req *req = NULL;
> > -	struct glusterfs_aio_state *state = NULL;
> > -	struct glusterfs_aio_wrapper *wrapper = NULL;
> > +	struct vfs_gluster_pwrite_state *state = talloc_get_type_abort(
> > +		private_data, struct vfs_gluster_pwrite_state);
> > +	struct timespec start_time;
> > +	struct timespec end_time;
> >  
> > -	req = tevent_req_create(mem_ctx, &wrapper, struct
> > glusterfs_aio_wrapper);
> > +	SMBPROFILE_BYTES_ASYNC_SET_BUSY(state->profile_bytes);
> >  
> > -	if (req == NULL) {
> > -		return NULL;
> > -	}
> > +	PROFILE_TIMESTAMP(&start_time);
> >  
> > -	state = talloc_zero(NULL, struct glusterfs_aio_state);
> > +	do {
> > +#ifdef HAVE_GFAPI_VER_7_6
> > +		state->ret = glfs_pwrite(state->fd, state->buf, state-
> > >count,
> > +					 state->offset, 0, NULL, NULL);
> > +#else
> > +		state->ret = glfs_pwrite(state->fd, state->buf, state-
> > >count,
> > +					 state->offset, 0);
> > +#endif
> > +	} while ((state->ret == -1) && (errno == EINTR));
> >  
> > -	if (state == NULL) {
> > -		TALLOC_FREE(req);
> > -		return NULL;
> > +	if (state->ret == -1) {
> > +		state->vfs_aio_state.error = errno;
> >  	}
> >  
> > -	talloc_set_destructor(wrapper, aio_wrapper_destructor);
> > -	state->cancelled = false;
> > -	state->req = req;
> > +	PROFILE_TIMESTAMP(&end_time);
> >  
> > -	wrapper->state = state;
> > +	state->vfs_aio_state.duration = nsec_time_diff(&end_time,
> > &start_time);
> >  
> > -	return state;
> > +	SMBPROFILE_BYTES_ASYNC_SET_IDLE(state->profile_bytes);
> >  }
> >  
> > -static struct tevent_req *vfs_gluster_pread_send(struct
> > vfs_handle_struct
> > -						  *handle, TALLOC_CTX
> > *mem_ctx,
> > -						  struct tevent_context
> > *ev,
> > -						  files_struct *fsp,
> > -						  void *data, size_t n,
> > -						  off_t offset)
> > +static int vfs_pwrite_state_destructor(struct
> > vfs_gluster_pwrite_state *state)
> >  {
> > -	struct glusterfs_aio_state *state = NULL;
> > -	struct tevent_req *req = NULL;
> > -	int ret = 0;
> > -	glfs_fd_t *glfd = vfs_gluster_fetch_glfd(handle, fsp);
> > -
> > -	if (glfd == NULL) {
> > -		DBG_ERR("Failed to fetch gluster fd\n");
> > -		return NULL;
> > -	}
> > +	return -1;
> > +}
> >  
> > -	state = aio_state_create(mem_ctx);
> > +static void vfs_pwrite_done(struct tevent_req *subreq)
> > +{
> > +	struct tevent_req *req = tevent_req_callback_data(
> > +		subreq, struct tevent_req);
> > +	struct vfs_gluster_pwrite_state *state = tevent_req_data(
> > +		req, struct vfs_gluster_pwrite_state);
> > +	int ret;
> >  
> > -	if (state == NULL) {
> > -		return NULL;
> > +	ret = pthreadpool_tevent_job_recv(subreq);
> > +	TALLOC_FREE(subreq);
> > +	SMBPROFILE_BYTES_ASYNC_END(state->profile_bytes);
> > +	talloc_set_destructor(state, NULL);
> > +	if (tevent_req_error(req, ret)) {
> > +		return;
> >  	}
> >  
> > -	req = state->req;
> > -
> > -	if (!init_gluster_aio(handle)) {
> > -		tevent_req_error(req, EIO);
> > -		return tevent_req_post(req, ev);
> > -	}
> > +	tevent_req_done(req);
> > +}
> >  
> > -	/*
> > -	 * aio_glusterfs_done and aio_tevent_fd_done()
> > -	 * use the raw tevent context. We need to use
> > -	 * tevent_req_defer_callback() in order to
> > -	 * use the event context we're started with.
> > -	 */
> > -	tevent_req_defer_callback(req, ev);
> > +static ssize_t vfs_gluster_pwrite_recv(struct tevent_req *req,
> > +				       struct vfs_aio_state
> > *vfs_aio_state)
> > +{
> > +	struct vfs_gluster_pwrite_state *state = tevent_req_data(
> > +		req, struct vfs_gluster_pwrite_state);
> >  
> > -	SMBPROFILE_BYTES_ASYNC_START(syscall_asys_pread, profile_p,
> > -				     state->profile_bytes, n);
> > -	PROFILE_TIMESTAMP(&state->start);
> > -	ret = glfs_pread_async(glfd, data, n, offset, 0,
> > aio_glusterfs_done,
> > -				state);
> > -	if (ret < 0) {
> > -		tevent_req_error(req, -ret);
> > -		return tevent_req_post(req, ev);
> > +	if (tevent_req_is_unix_error(req, &vfs_aio_state->error)) {
> > +		return -1;
> >  	}
> >  
> > -	return req;
> > +	*vfs_aio_state = state->vfs_aio_state;
> > +
> > +	return state->ret;
> >  }
> >  
> >  static struct tevent_req *vfs_gluster_pwrite_send(struct
> > vfs_handle_struct
> > @@ -961,78 +924,41 @@ static struct tevent_req
> > *vfs_gluster_pwrite_send(struct vfs_handle_struct
> >  						  const void *data,
> > size_t n,
> >  						  off_t offset)
> >  {
> > -	struct glusterfs_aio_state *state = NULL;
> > -	struct tevent_req *req = NULL;
> > -	int ret = 0;
> > -	glfs_fd_t *glfd = vfs_gluster_fetch_glfd(handle, fsp);
> > +	struct tevent_req *req, *subreq;
> > +	struct vfs_gluster_pwrite_state *state;
> >  
> > +	glfs_fd_t *glfd = vfs_gluster_fetch_glfd(handle, fsp);
> >  	if (glfd == NULL) {
> >  		DBG_ERR("Failed to fetch gluster fd\n");
> >  		return NULL;
> >  	}
> >  
> > -	state = aio_state_create(mem_ctx);
> > -
> > -	if (state == NULL) {
> > +	req = tevent_req_create(mem_ctx, &state, struct
> > vfs_gluster_pwrite_state);
> > +	if (req == NULL) {
> >  		return NULL;
> >  	}
> >  
> > -	req = state->req;
> > -
> > -	if (!init_gluster_aio(handle)) {
> > -		tevent_req_error(req, EIO);
> > -		return tevent_req_post(req, ev);
> > -	}
> > -
> > -	/*
> > -	 * aio_glusterfs_done and aio_tevent_fd_done()
> > -	 * use the raw tevent context. We need to use
> > -	 * tevent_req_defer_callback() in order to
> > -	 * use the event context we're started with.
> > -	 */
> > -	tevent_req_defer_callback(req, ev);
> > +	state->ret = -1;
> > +	state->fd = glfd;
> > +	state->buf = data;
> > +	state->count = n;
> > +	state->offset = offset;
> >  
> >  	SMBPROFILE_BYTES_ASYNC_START(syscall_asys_pwrite, profile_p,
> >  				     state->profile_bytes, n);
> > -	PROFILE_TIMESTAMP(&state->start);
> > -	ret = glfs_pwrite_async(glfd, data, n, offset, 0,
> > aio_glusterfs_done,
> > -				state);
> > -	if (ret < 0) {
> > -		tevent_req_error(req, -ret);
> > -		return tevent_req_post(req, ev);
> > -	}
> > -
> > -	return req;
> > -}
> > -
> > -static ssize_t vfs_gluster_recv(struct tevent_req *req,
> > -				struct vfs_aio_state *vfs_aio_state)
> > -{
> > -	struct glusterfs_aio_wrapper *wrapper = NULL;
> > -	int ret = 0;
> > +	SMBPROFILE_BYTES_ASYNC_SET_IDLE(state->profile_bytes);
> >  
> > -	wrapper = tevent_req_data(req, struct glusterfs_aio_wrapper);
> > -
> > -	if (wrapper == NULL) {
> > -		return -1;
> > -	}
> > -
> > -	if (wrapper->state == NULL) {
> > -		return -1;
> > -	}
> > -
> > -	if (tevent_req_is_unix_error(req, &vfs_aio_state->error)) {
> > -		return -1;
> > +	subreq = pthreadpool_tevent_job_send(
> > +		state, ev, handle->conn->sconn->pool,
> > +		vfs_gluster_pwrite_do, state);
> > +	if (tevent_req_nomem(subreq, req)) {
> > +		return tevent_req_post(req, ev);
> >  	}
> > +	tevent_req_set_callback(subreq, vfs_pwrite_done, req);
> >  
> > -	*vfs_aio_state = wrapper->state->vfs_aio_state;
> > -	ret = wrapper->state->ret;
> > -
> > -	/* Clean up the state, it is in a NULL context. */
> > +	talloc_set_destructor(state, vfs_pwrite_state_destructor);
> >  
> > -	TALLOC_FREE(wrapper->state);
> > -
> > -	return ret;
> > +	return req;
> >  }
> >  
> >  static ssize_t vfs_gluster_pwrite(struct vfs_handle_struct
> > *handle,
> > @@ -1115,62 +1041,121 @@ static int vfs_gluster_renameat(struct
> > vfs_handle_struct *handle,
> >  	return ret;
> >  }
> >  
> > +struct vfs_gluster_fsync_state {
> > +	ssize_t ret;
> > +	glfs_fd_t *fd;
> > +
> > +	struct vfs_aio_state vfs_aio_state;
> > +	SMBPROFILE_BYTES_ASYNC_STATE(profile_bytes);
> > +};
> > +
> > +static void vfs_fsync_do(void *private_data)
> > +{
> > +	struct vfs_gluster_fsync_state *state = talloc_get_type_abort(
> > +		private_data, struct vfs_gluster_fsync_state);
> > +	struct timespec start_time;
> > +	struct timespec end_time;
> > +
> > +	SMBPROFILE_BYTES_ASYNC_SET_BUSY(state->profile_bytes);
> > +
> > +	PROFILE_TIMESTAMP(&start_time);
> > +
> > +	do {
> > +#ifdef HAVE_GFAPI_VER_7_6
> > +		state->ret = glfs_fsync(state->fd, NULL, NULL);
> > +#else
> > +		state->ret = glfs_fsync(state->fd);
> > +#endif
> > +	} while ((state->ret == -1) && (errno == EINTR));
> > +
> > +	if (state->ret == -1) {
> > +		state->vfs_aio_state.error = errno;
> > +	}
> > +
> > +	PROFILE_TIMESTAMP(&end_time);
> > +
> > +	state->vfs_aio_state.duration = nsec_time_diff(&end_time,
> > &start_time);
> > +
> > +	SMBPROFILE_BYTES_ASYNC_SET_IDLE(state->profile_bytes);
> > +}
> > +
> > +static int vfs_fsync_state_destructor(struct
> > vfs_gluster_fsync_state *state)
> > +{
> > +	return -1;
> > +}
> > +
> > +static void vfs_fsync_done(struct tevent_req *subreq)
> > +{
> > +	struct tevent_req *req = tevent_req_callback_data(
> > +		subreq, struct tevent_req);
> > +	struct vfs_gluster_fsync_state *state = tevent_req_data(
> > +		req, struct vfs_gluster_fsync_state);
> > +	int ret;
> > +
> > +	ret = pthreadpool_tevent_job_recv(subreq);
> > +	TALLOC_FREE(subreq);
> > +	SMBPROFILE_BYTES_ASYNC_END(state->profile_bytes);
> > +	talloc_set_destructor(state, NULL);
> > +
> > +	if (tevent_req_error(req, ret)) {
> > +		return;
> > +	}
> > +
> > +	tevent_req_done(req);
> > +}
> > +
> > +static int vfs_gluster_fsync_recv(struct tevent_req *req,
> > +				  struct vfs_aio_state *vfs_aio_state)
> > +{
> > +	struct vfs_gluster_fsync_state *state = tevent_req_data(
> > +		req, struct vfs_gluster_fsync_state);
> > +
> > +	if (tevent_req_is_unix_error(req, &vfs_aio_state->error)) {
> > +		return -1;
> > +	}
> > +
> > +	*vfs_aio_state = state->vfs_aio_state;
> > +	return state->ret;
> > +}
> > +
> >  static struct tevent_req *vfs_gluster_fsync_send(struct
> > vfs_handle_struct
> >  						 *handle, TALLOC_CTX
> > *mem_ctx,
> >  						 struct tevent_context
> > *ev,
> >  						 files_struct *fsp)
> >  {
> > -	struct tevent_req *req = NULL;
> > -	struct glusterfs_aio_state *state = NULL;
> > -	int ret = 0;
> > -	glfs_fd_t *glfd = vfs_gluster_fetch_glfd(handle, fsp);
> > +	struct tevent_req *req, *subreq;
> > +	struct vfs_gluster_fsync_state *state;
> >  
> > +	glfs_fd_t *glfd = vfs_gluster_fetch_glfd(handle, fsp);
> >  	if (glfd == NULL) {
> >  		DBG_ERR("Failed to fetch gluster fd\n");
> >  		return NULL;
> >  	}
> >  
> > -	state = aio_state_create(mem_ctx);
> > -
> > -	if (state == NULL) {
> > +	req = tevent_req_create(mem_ctx, &state, struct
> > vfs_gluster_fsync_state);
> > +	if (req == NULL) {
> >  		return NULL;
> >  	}
> >  
> > -	req = state->req;
> > +	state->ret = -1;
> > +	state->fd = glfd;
> > +
> > +	SMBPROFILE_BYTES_ASYNC_START(syscall_asys_fsync, profile_p,
> > +                                     state->profile_bytes, 0);
> > +	SMBPROFILE_BYTES_ASYNC_SET_IDLE(state->profile_bytes);
> >  
> > -	if (!init_gluster_aio(handle)) {
> > -		tevent_req_error(req, EIO);
> > +	subreq = pthreadpool_tevent_job_send(
> > +		state, ev, handle->conn->sconn->pool, vfs_fsync_do,
> > state);
> > +	if (tevent_req_nomem(subreq, req)) {
> >  		return tevent_req_post(req, ev);
> >  	}
> > +	tevent_req_set_callback(subreq, vfs_fsync_done, req);
> >  
> > -	/*
> > -	 * aio_glusterfs_done and aio_tevent_fd_done()
> > -	 * use the raw tevent context. We need to use
> > -	 * tevent_req_defer_callback() in order to
> > -	 * use the event context we're started with.
> > -	 */
> > -	tevent_req_defer_callback(req, ev);
> > +	talloc_set_destructor(state, vfs_fsync_state_destructor);
> >  
> > -	SMBPROFILE_BYTES_ASYNC_START(syscall_asys_fsync, profile_p,
> > -				     state->profile_bytes, 0);
> > -	PROFILE_TIMESTAMP(&state->start);
> > -	ret = glfs_fsync_async(glfd, aio_glusterfs_done, state);
> > -	if (ret < 0) {
> > -		tevent_req_error(req, -ret);
> > -		return tevent_req_post(req, ev);
> > -	}
> >  	return req;
> >  }
> >  
> > -static int vfs_gluster_fsync_recv(struct tevent_req *req,
> > -				  struct vfs_aio_state *vfs_aio_state)
> > -{
> > -	/*
> > -	 * Use implicit conversion ssize_t->int
> > -	 */
> > -	return vfs_gluster_recv(req, vfs_aio_state);
> > -}
> > -
> >  static int vfs_gluster_stat(struct vfs_handle_struct *handle,
> >  			    struct smb_filename *smb_fname)
> >  {
> > @@ -1871,10 +1856,10 @@ static struct vfs_fn_pointers glusterfs_fns
> > = {
> >  	.close_fn = vfs_gluster_close,
> >  	.pread_fn = vfs_gluster_pread,
> >  	.pread_send_fn = vfs_gluster_pread_send,
> > -	.pread_recv_fn = vfs_gluster_recv,
> > +	.pread_recv_fn = vfs_gluster_pread_recv,
> >  	.pwrite_fn = vfs_gluster_pwrite,
> >  	.pwrite_send_fn = vfs_gluster_pwrite_send,
> > -	.pwrite_recv_fn = vfs_gluster_recv,
> > +	.pwrite_recv_fn = vfs_gluster_pwrite_recv,
> >  	.lseek_fn = vfs_gluster_lseek,
> >  	.sendfile_fn = vfs_gluster_sendfile,
> >  	.recvfile_fn = vfs_gluster_recvfile,
> > -- 
> > 2.21.0
> > 
> 
> 

--=-+S9Sh624DE3ZHZvOvSk5
Content-Disposition: attachment; filename="master.patch"
Content-Type: text/x-patch; name="master.patch"; charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSA0ZDZjMmViMGQ3NGFkNWYzNThhZjY4NzI4MzNlMDI3NDA4MmY0OWE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBQb29ybmltYSBHIDxwZ3VydXNpZEByZWRoYXQuY29tPgpEYXRl
OiBXZWQsIDI0IEp1bCAyMDE5IDE1OjE1OjMzICswNTMwClN1YmplY3Q6IFtQQVRDSF0gdmZzX2ds
dXN0ZXJmczogVXNlIHB0aHJlYWRwb29sIGZvciBzY2hlZHVsaW5nIGFpbyBvcGVyYXRpb25zCgpC
VUc6IGh0dHBzOi8vYnVnemlsbGEuc2FtYmEub3JnL3Nob3dfYnVnLmNnaT9pZD0xNDA5OAoKU2ln
bmVkLW9mZi1ieTogUG9vcm5pbWEgRyA8cGd1cnVzaWRAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6
IEd1ZW50aGVyIERlc2NobmVyIDxnZEBzYW1iYS5vcmc+Ci0tLQogc291cmNlMy9tb2R1bGVzL3Zm
c19nbHVzdGVyZnMuYyB8IDU2MiArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDI5NCBpbnNlcnRpb25zKCspLCAyNjggZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvc291cmNlMy9tb2R1bGVzL3Zmc19nbHVzdGVyZnMuYyBiL3NvdXJjZTMvbW9kdWxlcy92
ZnNfZ2x1c3RlcmZzLmMKaW5kZXggMDkyOTliYzcwYzUuLjY5YzU4MDUyM2FhIDEwMDY0NAotLS0g
YS9zb3VyY2UzL21vZHVsZXMvdmZzX2dsdXN0ZXJmcy5jCisrKyBiL3NvdXJjZTMvbW9kdWxlcy92
ZnNfZ2x1c3RlcmZzLmMKQEAgLTQ1LDE0ICs0NSwxMSBAQAogI2luY2x1ZGUgImxpYi91dGlsL3N5
c19ydy5oIgogI2luY2x1ZGUgInNtYnByb2ZpbGUuaCIKICNpbmNsdWRlICJtb2R1bGVzL3Bvc2l4
YWNsX3hhdHRyLmgiCisjaW5jbHVkZSAibGliL3B0aHJlYWRwb29sL3B0aHJlYWRwb29sX3RldmVu
dC5oIgogCiAjZGVmaW5lIERFRkFVTFRfVk9MRklMRV9TRVJWRVIgImxvY2FsaG9zdCIKICNkZWZp
bmUgR0xVU1RFUl9OQU1FX01BWCAyNTUKIAotc3RhdGljIGludCByZWFkX2ZkID0gLTE7Ci1zdGF0
aWMgaW50IHdyaXRlX2ZkID0gLTE7Ci1zdGF0aWMgc3RydWN0IHRldmVudF9mZCAqYWlvX3JlYWRf
ZXZlbnQgPSBOVUxMOwotCiAvKioKICAqIEhlbHBlciB0byBjb252ZXJ0IHN0cnVjdCBzdGF0IHRv
IHN0cnVjdCBzdGF0X2V4LgogICovCkBAIC03MTMsMzI2ICs3MTAsMjgzIEBAIHN0YXRpYyBzc2l6
ZV90IHZmc19nbHVzdGVyX3ByZWFkKHN0cnVjdCB2ZnNfaGFuZGxlX3N0cnVjdCAqaGFuZGxlLAog
CXJldHVybiByZXQ7CiB9CiAKLXN0cnVjdCBnbHVzdGVyZnNfYWlvX3N0YXRlOwotCi1zdHJ1Y3Qg
Z2x1c3RlcmZzX2Fpb193cmFwcGVyIHsKLQlzdHJ1Y3QgZ2x1c3RlcmZzX2Fpb19zdGF0ZSAqc3Rh
dGU7Ci19OwotCi1zdHJ1Y3QgZ2x1c3RlcmZzX2Fpb19zdGF0ZSB7CitzdHJ1Y3QgdmZzX2dsdXN0
ZXJfcHJlYWRfc3RhdGUgewogCXNzaXplX3QgcmV0OwotCXN0cnVjdCB0ZXZlbnRfcmVxICpyZXE7
Ci0JYm9vbCBjYW5jZWxsZWQ7CisJZ2xmc19mZF90ICpmZDsKKwl2b2lkICpidWY7CisJc2l6ZV90
IGNvdW50OworCW9mZl90IG9mZnNldDsKKwogCXN0cnVjdCB2ZnNfYWlvX3N0YXRlIHZmc19haW9f
c3RhdGU7Ci0Jc3RydWN0IHRpbWVzcGVjIHN0YXJ0OwogCVNNQlBST0ZJTEVfQllURVNfQVNZTkNf
U1RBVEUocHJvZmlsZV9ieXRlcyk7CiB9OwogCi1zdGF0aWMgaW50IGFpb193cmFwcGVyX2Rlc3Ry
dWN0b3Ioc3RydWN0IGdsdXN0ZXJmc19haW9fd3JhcHBlciAqd3JhcCkKLXsKLQlpZiAod3JhcC0+
c3RhdGUgIT0gTlVMTCkgewotCQl3cmFwLT5zdGF0ZS0+Y2FuY2VsbGVkID0gdHJ1ZTsKLQl9Ci0K
LQlyZXR1cm4gMDsKLX0KK3N0YXRpYyB2b2lkIHZmc19nbHVzdGVyX3ByZWFkX2RvKHZvaWQgKnBy
aXZhdGVfZGF0YSk7CitzdGF0aWMgdm9pZCB2ZnNfZ2x1c3Rlcl9wcmVhZF9kb25lKHN0cnVjdCB0
ZXZlbnRfcmVxICpzdWJyZXEpOworc3RhdGljIGludCB2ZnNfZ2x1c3Rlcl9wcmVhZF9zdGF0ZV9k
ZXN0cnVjdG9yKHN0cnVjdCB2ZnNfZ2x1c3Rlcl9wcmVhZF9zdGF0ZSAqc3RhdGUpOwogCi0vKgot
ICogVGhpcyBmdW5jdGlvbiBpcyB0aGUgY2FsbGJhY2sgdGhhdCB3aWxsIGJlIGNhbGxlZCBvbiBn
bHVzdGVyZnMKLSAqIHRocmVhZHMgb25jZSB0aGUgYXN5bmMgSU8gc3VibWl0dGVkIGlzIGNvbXBs
ZXRlLiBUbyBub3RpZnkKLSAqIFNhbWJhIG9mIHRoZSBjb21wbGV0aW9uIHdlIHVzZSBhIHBpcGUg
YmFzZWQgcXVldWUuCi0gKi8KLSNpZmRlZiBIQVZFX0dGQVBJX1ZFUl83XzYKLXN0YXRpYyB2b2lk
IGFpb19nbHVzdGVyZnNfZG9uZShnbGZzX2ZkX3QgKmZkLCBzc2l6ZV90IHJldCwKLQkJCSAgICAg
ICBzdHJ1Y3QgZ2xmc19zdGF0ICpwcmVzdGF0LAotCQkJICAgICAgIHN0cnVjdCBnbGZzX3N0YXQg
KnBvc3RzdGF0LAotCQkJICAgICAgIHZvaWQgKmRhdGEpCi0jZWxzZQotc3RhdGljIHZvaWQgYWlv
X2dsdXN0ZXJmc19kb25lKGdsZnNfZmRfdCAqZmQsIHNzaXplX3QgcmV0LCB2b2lkICpkYXRhKQot
I2VuZGlmCitzdGF0aWMgc3RydWN0IHRldmVudF9yZXEgKnZmc19nbHVzdGVyX3ByZWFkX3NlbmQo
c3RydWN0IHZmc19oYW5kbGVfc3RydWN0CisJCQkJCQkgICpoYW5kbGUsIFRBTExPQ19DVFggKm1l
bV9jdHgsCisJCQkJCQkgIHN0cnVjdCB0ZXZlbnRfY29udGV4dCAqZXYsCisJCQkJCQkgIGZpbGVz
X3N0cnVjdCAqZnNwLAorCQkJCQkJICB2b2lkICpkYXRhLCBzaXplX3QgbiwKKwkJCQkJCSAgb2Zm
X3Qgb2Zmc2V0KQogewotCXN0cnVjdCBnbHVzdGVyZnNfYWlvX3N0YXRlICpzdGF0ZSA9IE5VTEw7
Ci0JaW50IHN0cyA9IDA7Ci0Jc3RydWN0IHRpbWVzcGVjIGVuZDsKLQotCXN0YXRlID0gKHN0cnVj
dCBnbHVzdGVyZnNfYWlvX3N0YXRlICopZGF0YTsKKwlzdHJ1Y3QgdmZzX2dsdXN0ZXJfcHJlYWRf
c3RhdGUgKnN0YXRlOworCXN0cnVjdCB0ZXZlbnRfcmVxICpyZXEsICpzdWJyZXE7CiAKLQlQUk9G
SUxFX1RJTUVTVEFNUCgmZW5kKTsKKwlnbGZzX2ZkX3QgKmdsZmQgPSB2ZnNfZ2x1c3Rlcl9mZXRj
aF9nbGZkKGhhbmRsZSwgZnNwKTsKKwlpZiAoZ2xmZCA9PSBOVUxMKSB7CisJCURCR19FUlIoIkZh
aWxlZCB0byBmZXRjaCBnbHVzdGVyIGZkXG4iKTsKKwkJcmV0dXJuIE5VTEw7CisJfQogCi0JaWYg
KHJldCA8IDApIHsKLQkJc3RhdGUtPnJldCA9IC0xOwotCQlzdGF0ZS0+dmZzX2Fpb19zdGF0ZS5l
cnJvciA9IGVycm5vOwotCX0gZWxzZSB7Ci0JCXN0YXRlLT5yZXQgPSByZXQ7CisJcmVxID0gdGV2
ZW50X3JlcV9jcmVhdGUobWVtX2N0eCwgJnN0YXRlLCBzdHJ1Y3QgdmZzX2dsdXN0ZXJfcHJlYWRf
c3RhdGUpOworCWlmIChyZXEgPT0gTlVMTCkgeworCQlyZXR1cm4gTlVMTDsKIAl9Ci0Jc3RhdGUt
PnZmc19haW9fc3RhdGUuZHVyYXRpb24gPSBuc2VjX3RpbWVfZGlmZigmZW5kLCAmc3RhdGUtPnN0
YXJ0KTsKIAotCVNNQlBST0ZJTEVfQllURVNfQVNZTkNfRU5EKHN0YXRlLT5wcm9maWxlX2J5dGVz
KTsKKwlzdGF0ZS0+cmV0ID0gLTE7CisJc3RhdGUtPmZkID0gZ2xmZDsKKwlzdGF0ZS0+YnVmID0g
ZGF0YTsKKwlzdGF0ZS0+Y291bnQgPSBuOworCXN0YXRlLT5vZmZzZXQgPSBvZmZzZXQ7CiAKLQkv
KgotCSAqIFdyaXRlIHRoZSBzdGF0ZSBwb2ludGVyIHRvIGdsdXN0ZXJmc19haW9fc3RhdGUgdG8g
dGhlCi0JICogcGlwZSwgc28gd2UgY2FuIGNhbGwgdGV2ZW50X3JlcV9kb25lKCkgZnJvbSB0aGUg
bWFpbiB0aHJlYWQsCi0JICogYmVjYXVzZSB0ZXZlbnRfcmVxX2RvbmUoKSBpcyBub3QgZGVzaWdu
ZWQgdG8gYmUgZXhlY3V0ZWQgaW4KLQkgKiB0aGUgbXVsdGl0aHJlYWQgZW52aXJvbm1lbnQsIHNv
IHRldmVudF9yZXFfZG9uZSgpIG11c3QgYmUKLQkgKiBleGVjdXRlZCBmcm9tIHRoZSBzbWJkIG1h
aW4gdGhyZWFkLgotCSAqCi0JICogd3JpdGUoMikgb24gcGlwZXMgd2l0aCBzaXplcyB1bmRlciBf
UE9TSVhfUElQRV9CVUYKLQkgKiBpbiBzaXplIGlzIGF0b21pYywgd2l0aG91dCB0aGlzLCB0aGUg
dXNlIG9wIHBpcGVzIGluIHRoaXMKLQkgKiBjb2RlIHdvdWxkIG5vdCB3b3JrLgotCSAqCi0JICog
c3lzX3dyaXRlIGlzIGEgdGhpbiBlbm91Z2ggd3JhcHBlciBhcm91bmQgd3JpdGUoMikKLQkgKiB0
aGF0IHdlIGNhbiB0cnVzdCBpdCBoZXJlLgotCSAqLworCVNNQlBST0ZJTEVfQllURVNfQVNZTkNf
U1RBUlQoc3lzY2FsbF9hc3lzX3ByZWFkLCBwcm9maWxlX3AsCisJCQkJICAgICBzdGF0ZS0+cHJv
ZmlsZV9ieXRlcywgbik7CisJU01CUFJPRklMRV9CWVRFU19BU1lOQ19TRVRfSURMRShzdGF0ZS0+
cHJvZmlsZV9ieXRlcyk7CiAKLQlzdHMgPSBzeXNfd3JpdGUod3JpdGVfZmQsICZzdGF0ZSwgc2l6
ZW9mKHN0cnVjdCBnbHVzdGVyZnNfYWlvX3N0YXRlICopKTsKLQlpZiAoc3RzIDwgMCkgewotCQlE
RUJVRygwLCgiXG5Xcml0ZSB0byBwaXBlIGZhaWxlZCAoJXMpIiwgc3RyZXJyb3IoZXJybm8pKSk7
CisJc3VicmVxID0gcHRocmVhZHBvb2xfdGV2ZW50X2pvYl9zZW5kKAorCQlzdGF0ZSwgZXYsIGhh
bmRsZS0+Y29ubi0+c2Nvbm4tPnBvb2wsCisJCXZmc19nbHVzdGVyX3ByZWFkX2RvLCBzdGF0ZSk7
CisJaWYgKHRldmVudF9yZXFfbm9tZW0oc3VicmVxLCByZXEpKSB7CisJCXJldHVybiB0ZXZlbnRf
cmVxX3Bvc3QocmVxLCBldik7CiAJfQorCXRldmVudF9yZXFfc2V0X2NhbGxiYWNrKHN1YnJlcSwg
dmZzX2dsdXN0ZXJfcHJlYWRfZG9uZSwgcmVxKTsKKworCXRhbGxvY19zZXRfZGVzdHJ1Y3Rvcihz
dGF0ZSwgdmZzX2dsdXN0ZXJfcHJlYWRfc3RhdGVfZGVzdHJ1Y3Rvcik7CiAKLQlyZXR1cm47CisJ
cmV0dXJuIHJlcTsKIH0KIAotLyoKLSAqIFJlYWQgZWFjaCByZXEgb2ZmIHRoZSBwaXBlIGFuZCBw
cm9jZXNzIGl0LgotICovCi1zdGF0aWMgdm9pZCBhaW9fdGV2ZW50X2ZkX2RvbmUoc3RydWN0IHRl
dmVudF9jb250ZXh0ICpldmVudF9jdHgsCi0JCQkJc3RydWN0IHRldmVudF9mZCAqZmRlLAotCQkJ
CXVpbnQxNl90IGZsYWdzLCB2b2lkICpkYXRhKQorc3RhdGljIHZvaWQgdmZzX2dsdXN0ZXJfcHJl
YWRfZG8odm9pZCAqcHJpdmF0ZV9kYXRhKQogewotCXN0cnVjdCB0ZXZlbnRfcmVxICpyZXEgPSBO
VUxMOwotCXN0cnVjdCBnbHVzdGVyZnNfYWlvX3N0YXRlICpzdGF0ZSA9IE5VTEw7Ci0JaW50IHN0
cyA9IDA7CisJc3RydWN0IHZmc19nbHVzdGVyX3ByZWFkX3N0YXRlICpzdGF0ZSA9IHRhbGxvY19n
ZXRfdHlwZV9hYm9ydCgKKwkJcHJpdmF0ZV9kYXRhLCBzdHJ1Y3QgdmZzX2dsdXN0ZXJfcHJlYWRf
c3RhdGUpOworCXN0cnVjdCB0aW1lc3BlYyBzdGFydF90aW1lOworCXN0cnVjdCB0aW1lc3BlYyBl
bmRfdGltZTsKIAotCS8qCi0JICogcmVhZCgyKSBvbiBwaXBlcyBpcyBhdG9taWMgaWYgdGhlIG5l
ZWRlZCBkYXRhIGlzIGF2YWlsYWJsZQotCSAqIGluIHRoZSBwaXBlLCBwZXIgU1VTIGFuZCBQT1NJ
WC4gIEJlY2F1c2Ugd2UgYWx3YXlzIHdyaXRlCi0JICogdG8gdGhlIHBpcGUgaW4gc2l6ZW9mKHN0
cnVjdCB0ZXZlbnRfcmVxICopIGNodW5rcywgd2UgY2FuCi0JICogYWx3YXlzIHJlYWQgaW4gdGhv
c2UgY2h1bmtzLCBhdG9taWNhbGx5LgotCSAqCi0JICogc3lzX3JlYWQgaXMgYSB0aGluIGVub3Vn
aCB3cmFwcGVyIGFyb3VuZCByZWFkKDIpIHRoYXQgd2UKLQkgKiBjYW4gdHJ1c3QgaXQgaGVyZS4K
LQkgKi8KKwlTTUJQUk9GSUxFX0JZVEVTX0FTWU5DX1NFVF9CVVNZKHN0YXRlLT5wcm9maWxlX2J5
dGVzKTsKIAotCXN0cyA9IHN5c19yZWFkKHJlYWRfZmQsICZzdGF0ZSwgc2l6ZW9mKHN0cnVjdCBn
bHVzdGVyZnNfYWlvX3N0YXRlICopKTsKKwlQUk9GSUxFX1RJTUVTVEFNUCgmc3RhcnRfdGltZSk7
CiAKLQlpZiAoc3RzIDwgMCkgewotCQlERUJVRygwLCgiXG5SZWFkIGZyb20gcGlwZSBmYWlsZWQg
KCVzKSIsIHN0cmVycm9yKGVycm5vKSkpOwotCX0KKwlkbyB7CisjaWZkZWYgSEFWRV9HRkFQSV9W
RVJfN182CisJCXN0YXRlLT5yZXQgPSBnbGZzX3ByZWFkKHN0YXRlLT5mZCwgc3RhdGUtPmJ1Ziwg
c3RhdGUtPmNvdW50LAorCQkJCQlzdGF0ZS0+b2Zmc2V0LCAwLCBOVUxMKTsKKyNlbHNlCisJCXN0
YXRlLT5yZXQgPSBnbGZzX3ByZWFkKHN0YXRlLT5mZCwgc3RhdGUtPmJ1Ziwgc3RhdGUtPmNvdW50
LAorCQkJCQlzdGF0ZS0+b2Zmc2V0LCAwKTsKKyNlbmRpZgorCX0gd2hpbGUgKChzdGF0ZS0+cmV0
ID09IC0xKSAmJiAoZXJybm8gPT0gRUlOVFIpKTsKIAotCS8qIGlmIHdlJ3ZlIGNhbmNlbGxlZCB0
aGUgb3AsIHRoZXJlIGlzIG5vIHJlcSwgc28ganVzdCBjbGVhbiB1cC4gKi8KLQlpZiAoc3RhdGUt
PmNhbmNlbGxlZCA9PSB0cnVlKSB7Ci0JCVRBTExPQ19GUkVFKHN0YXRlKTsKLQkJcmV0dXJuOwor
CWlmIChzdGF0ZS0+cmV0ID09IC0xKSB7CisJCXN0YXRlLT52ZnNfYWlvX3N0YXRlLmVycm9yID0g
ZXJybm87CiAJfQogCi0JcmVxID0gc3RhdGUtPnJlcTsKKwlQUk9GSUxFX1RJTUVTVEFNUCgmZW5k
X3RpbWUpOwogCi0JaWYgKHJlcSkgewotCQl0ZXZlbnRfcmVxX2RvbmUocmVxKTsKLQl9Ci0JcmV0
dXJuOworCXN0YXRlLT52ZnNfYWlvX3N0YXRlLmR1cmF0aW9uID0gbnNlY190aW1lX2RpZmYoJmVu
ZF90aW1lLCAmc3RhcnRfdGltZSk7CisKKwlTTUJQUk9GSUxFX0JZVEVTX0FTWU5DX1NFVF9JRExF
KHN0YXRlLT5wcm9maWxlX2J5dGVzKTsKIH0KIAotc3RhdGljIGJvb2wgaW5pdF9nbHVzdGVyX2Fp
byhzdHJ1Y3QgdmZzX2hhbmRsZV9zdHJ1Y3QgKmhhbmRsZSkKK3N0YXRpYyBpbnQgdmZzX2dsdXN0
ZXJfcHJlYWRfc3RhdGVfZGVzdHJ1Y3RvcihzdHJ1Y3QgdmZzX2dsdXN0ZXJfcHJlYWRfc3RhdGUg
KnN0YXRlKQogewotCWludCBmZHNbMl07Ci0JaW50IHJldCA9IC0xOworCXJldHVybiAtMTsKK30K
IAotCWlmIChyZWFkX2ZkICE9IC0xKSB7CitzdGF0aWMgdm9pZCB2ZnNfZ2x1c3Rlcl9wcmVhZF9k
b25lKHN0cnVjdCB0ZXZlbnRfcmVxICpzdWJyZXEpCit7CisJc3RydWN0IHRldmVudF9yZXEgKnJl
cSA9IHRldmVudF9yZXFfY2FsbGJhY2tfZGF0YSgKKwkJc3VicmVxLCBzdHJ1Y3QgdGV2ZW50X3Jl
cSk7CisJc3RydWN0IHZmc19nbHVzdGVyX3ByZWFkX3N0YXRlICpzdGF0ZSA9IHRldmVudF9yZXFf
ZGF0YSgKKwkJcmVxLCBzdHJ1Y3QgdmZzX2dsdXN0ZXJfcHJlYWRfc3RhdGUpOworCWludCByZXQ7
CisKKwlyZXQgPSBwdGhyZWFkcG9vbF90ZXZlbnRfam9iX3JlY3Yoc3VicmVxKTsKKwlUQUxMT0Nf
RlJFRShzdWJyZXEpOworCVNNQlBST0ZJTEVfQllURVNfQVNZTkNfRU5EKHN0YXRlLT5wcm9maWxl
X2J5dGVzKTsKKwl0YWxsb2Nfc2V0X2Rlc3RydWN0b3Ioc3RhdGUsIE5VTEwpOworCWlmIChyZXQg
IT0gMCkgeworCQlpZiAocmV0ICE9IEVBR0FJTikgeworCQkJdGV2ZW50X3JlcV9lcnJvcihyZXEs
IHJldCk7CisJCQlyZXR1cm47CisJCX0KIAkJLyoKLQkJICogQWxyZWFkeSBpbml0aWFsaXplZC4K
KwkJICogSWYgd2UgZ2V0IEVBR0FJTiBmcm9tIHB0aHJlYWRwb29sX3RldmVudF9qb2JfcmVjdigp
IHRoaXMKKwkJICogbWVhbnMgdGhlIGxvd2VyIGxldmVsIHB0aHJlYWRwb29sIGZhaWxlZCB0byBj
cmVhdGUgYSBuZXcKKwkJICogdGhyZWFkLiBGYWxsYmFjayB0byBzeW5jIHByb2Nlc3NpbmcgaW4g
dGhhdCBjYXNlIHRvIGFsbG93CisJCSAqIHNvbWUgcHJvZ3Jlc3MgZm9yIHRoZSBjbGllbnQuCiAJ
CSAqLwotCQlyZXR1cm4gdHJ1ZTsKLQl9Ci0KLQlyZXQgPSBwaXBlKGZkcyk7Ci0JaWYgKHJldCA9
PSAtMSkgewotCQlnb3RvIGZhaWw7Ci0JfQotCi0JcmVhZF9mZCA9IGZkc1swXTsKLQl3cml0ZV9m
ZCA9IGZkc1sxXTsKLQotCWFpb19yZWFkX2V2ZW50ID0gdGV2ZW50X2FkZF9mZChoYW5kbGUtPmNv
bm4tPnNjb25uLT5ldl9jdHgsCi0JCQkJCU5VTEwsCi0JCQkJCXJlYWRfZmQsCi0JCQkJCVRFVkVO
VF9GRF9SRUFELAotCQkJCQlhaW9fdGV2ZW50X2ZkX2RvbmUsCi0JCQkJCU5VTEwpOwotCWlmIChh
aW9fcmVhZF9ldmVudCA9PSBOVUxMKSB7Ci0JCWdvdG8gZmFpbDsKKwkJdmZzX2dsdXN0ZXJfcHJl
YWRfZG8oc3RhdGUpOwogCX0KIAotCXJldHVybiB0cnVlOwotZmFpbDoKLQlUQUxMT0NfRlJFRShh
aW9fcmVhZF9ldmVudCk7Ci0JaWYgKHJlYWRfZmQgIT0gLTEpIHsKLQkJY2xvc2UocmVhZF9mZCk7
Ci0JCWNsb3NlKHdyaXRlX2ZkKTsKLQkJcmVhZF9mZCA9IC0xOwotCQl3cml0ZV9mZCA9IC0xOwot
CX0KLQlyZXR1cm4gZmFsc2U7CisJdGV2ZW50X3JlcV9kb25lKHJlcSk7CiB9CiAKLXN0YXRpYyBz
dHJ1Y3QgZ2x1c3RlcmZzX2Fpb19zdGF0ZSAqYWlvX3N0YXRlX2NyZWF0ZShUQUxMT0NfQ1RYICpt
ZW1fY3R4KQorc3RhdGljIHNzaXplX3QgdmZzX2dsdXN0ZXJfcHJlYWRfcmVjdihzdHJ1Y3QgdGV2
ZW50X3JlcSAqcmVxLAorCQkJCSAgICAgIHN0cnVjdCB2ZnNfYWlvX3N0YXRlICp2ZnNfYWlvX3N0
YXRlKQogewotCXN0cnVjdCB0ZXZlbnRfcmVxICpyZXEgPSBOVUxMOwotCXN0cnVjdCBnbHVzdGVy
ZnNfYWlvX3N0YXRlICpzdGF0ZSA9IE5VTEw7Ci0Jc3RydWN0IGdsdXN0ZXJmc19haW9fd3JhcHBl
ciAqd3JhcHBlciA9IE5VTEw7CisJc3RydWN0IHZmc19nbHVzdGVyX3ByZWFkX3N0YXRlICpzdGF0
ZSA9IHRldmVudF9yZXFfZGF0YSgKKwkJcmVxLCBzdHJ1Y3QgdmZzX2dsdXN0ZXJfcHJlYWRfc3Rh
dGUpOwogCi0JcmVxID0gdGV2ZW50X3JlcV9jcmVhdGUobWVtX2N0eCwgJndyYXBwZXIsIHN0cnVj
dCBnbHVzdGVyZnNfYWlvX3dyYXBwZXIpOwotCi0JaWYgKHJlcSA9PSBOVUxMKSB7Ci0JCXJldHVy
biBOVUxMOworCWlmICh0ZXZlbnRfcmVxX2lzX3VuaXhfZXJyb3IocmVxLCAmdmZzX2Fpb19zdGF0
ZS0+ZXJyb3IpKSB7CisJCXJldHVybiAtMTsKIAl9CiAKLQlzdGF0ZSA9IHRhbGxvY196ZXJvKE5V
TEwsIHN0cnVjdCBnbHVzdGVyZnNfYWlvX3N0YXRlKTsKLQotCWlmIChzdGF0ZSA9PSBOVUxMKSB7
Ci0JCVRBTExPQ19GUkVFKHJlcSk7Ci0JCXJldHVybiBOVUxMOwotCX0KKwkqdmZzX2Fpb19zdGF0
ZSA9IHN0YXRlLT52ZnNfYWlvX3N0YXRlOworCXJldHVybiBzdGF0ZS0+cmV0OworfQogCi0JdGFs
bG9jX3NldF9kZXN0cnVjdG9yKHdyYXBwZXIsIGFpb193cmFwcGVyX2Rlc3RydWN0b3IpOwotCXN0
YXRlLT5jYW5jZWxsZWQgPSBmYWxzZTsKLQlzdGF0ZS0+cmVxID0gcmVxOworc3RydWN0IHZmc19n
bHVzdGVyX3B3cml0ZV9zdGF0ZSB7CisJc3NpemVfdCByZXQ7CisJZ2xmc19mZF90ICpmZDsKKwlj
b25zdCB2b2lkICpidWY7CisJc2l6ZV90IGNvdW50OworCW9mZl90IG9mZnNldDsKIAotCXdyYXBw
ZXItPnN0YXRlID0gc3RhdGU7CisJc3RydWN0IHZmc19haW9fc3RhdGUgdmZzX2Fpb19zdGF0ZTsK
KwlTTUJQUk9GSUxFX0JZVEVTX0FTWU5DX1NUQVRFKHByb2ZpbGVfYnl0ZXMpOworfTsKIAotCXJl
dHVybiBzdGF0ZTsKLX0KK3N0YXRpYyB2b2lkIHZmc19nbHVzdGVyX3B3cml0ZV9kbyh2b2lkICpw
cml2YXRlX2RhdGEpOworc3RhdGljIHZvaWQgdmZzX2dsdXN0ZXJfcHdyaXRlX2RvbmUoc3RydWN0
IHRldmVudF9yZXEgKnN1YnJlcSk7CitzdGF0aWMgaW50IHZmc19nbHVzdGVyX3B3cml0ZV9zdGF0
ZV9kZXN0cnVjdG9yKHN0cnVjdCB2ZnNfZ2x1c3Rlcl9wd3JpdGVfc3RhdGUgKnN0YXRlKTsKIAot
c3RhdGljIHN0cnVjdCB0ZXZlbnRfcmVxICp2ZnNfZ2x1c3Rlcl9wcmVhZF9zZW5kKHN0cnVjdCB2
ZnNfaGFuZGxlX3N0cnVjdAorc3RhdGljIHN0cnVjdCB0ZXZlbnRfcmVxICp2ZnNfZ2x1c3Rlcl9w
d3JpdGVfc2VuZChzdHJ1Y3QgdmZzX2hhbmRsZV9zdHJ1Y3QKIAkJCQkJCSAgKmhhbmRsZSwgVEFM
TE9DX0NUWCAqbWVtX2N0eCwKIAkJCQkJCSAgc3RydWN0IHRldmVudF9jb250ZXh0ICpldiwKIAkJ
CQkJCSAgZmlsZXNfc3RydWN0ICpmc3AsCi0JCQkJCQkgIHZvaWQgKmRhdGEsIHNpemVfdCBuLAor
CQkJCQkJICBjb25zdCB2b2lkICpkYXRhLCBzaXplX3QgbiwKIAkJCQkJCSAgb2ZmX3Qgb2Zmc2V0
KQogewotCXN0cnVjdCBnbHVzdGVyZnNfYWlvX3N0YXRlICpzdGF0ZSA9IE5VTEw7Ci0Jc3RydWN0
IHRldmVudF9yZXEgKnJlcSA9IE5VTEw7Ci0JaW50IHJldCA9IDA7Ci0JZ2xmc19mZF90ICpnbGZk
ID0gdmZzX2dsdXN0ZXJfZmV0Y2hfZ2xmZChoYW5kbGUsIGZzcCk7CisJc3RydWN0IHRldmVudF9y
ZXEgKnJlcSwgKnN1YnJlcTsKKwlzdHJ1Y3QgdmZzX2dsdXN0ZXJfcHdyaXRlX3N0YXRlICpzdGF0
ZTsKIAorCWdsZnNfZmRfdCAqZ2xmZCA9IHZmc19nbHVzdGVyX2ZldGNoX2dsZmQoaGFuZGxlLCBm
c3ApOwogCWlmIChnbGZkID09IE5VTEwpIHsKIAkJREJHX0VSUigiRmFpbGVkIHRvIGZldGNoIGds
dXN0ZXIgZmRcbiIpOwogCQlyZXR1cm4gTlVMTDsKIAl9CiAKLQlzdGF0ZSA9IGFpb19zdGF0ZV9j
cmVhdGUobWVtX2N0eCk7Ci0KLQlpZiAoc3RhdGUgPT0gTlVMTCkgeworCXJlcSA9IHRldmVudF9y
ZXFfY3JlYXRlKG1lbV9jdHgsICZzdGF0ZSwgc3RydWN0IHZmc19nbHVzdGVyX3B3cml0ZV9zdGF0
ZSk7CisJaWYgKHJlcSA9PSBOVUxMKSB7CiAJCXJldHVybiBOVUxMOwogCX0KIAotCXJlcSA9IHN0
YXRlLT5yZXE7CisJc3RhdGUtPnJldCA9IC0xOworCXN0YXRlLT5mZCA9IGdsZmQ7CisJc3RhdGUt
PmJ1ZiA9IGRhdGE7CisJc3RhdGUtPmNvdW50ID0gbjsKKwlzdGF0ZS0+b2Zmc2V0ID0gb2Zmc2V0
OwogCi0JaWYgKCFpbml0X2dsdXN0ZXJfYWlvKGhhbmRsZSkpIHsKLQkJdGV2ZW50X3JlcV9lcnJv
cihyZXEsIEVJTyk7Ci0JCXJldHVybiB0ZXZlbnRfcmVxX3Bvc3QocmVxLCBldik7Ci0JfQotCi0J
LyoKLQkgKiBhaW9fZ2x1c3RlcmZzX2RvbmUgYW5kIGFpb190ZXZlbnRfZmRfZG9uZSgpCi0JICog
dXNlIHRoZSByYXcgdGV2ZW50IGNvbnRleHQuIFdlIG5lZWQgdG8gdXNlCi0JICogdGV2ZW50X3Jl
cV9kZWZlcl9jYWxsYmFjaygpIGluIG9yZGVyIHRvCi0JICogdXNlIHRoZSBldmVudCBjb250ZXh0
IHdlJ3JlIHN0YXJ0ZWQgd2l0aC4KLQkgKi8KLQl0ZXZlbnRfcmVxX2RlZmVyX2NhbGxiYWNrKHJl
cSwgZXYpOwotCi0JU01CUFJPRklMRV9CWVRFU19BU1lOQ19TVEFSVChzeXNjYWxsX2FzeXNfcHJl
YWQsIHByb2ZpbGVfcCwKKwlTTUJQUk9GSUxFX0JZVEVTX0FTWU5DX1NUQVJUKHN5c2NhbGxfYXN5
c19wd3JpdGUsIHByb2ZpbGVfcCwKIAkJCQkgICAgIHN0YXRlLT5wcm9maWxlX2J5dGVzLCBuKTsK
LQlQUk9GSUxFX1RJTUVTVEFNUCgmc3RhdGUtPnN0YXJ0KTsKLQlyZXQgPSBnbGZzX3ByZWFkX2Fz
eW5jKGdsZmQsIGRhdGEsIG4sIG9mZnNldCwgMCwgYWlvX2dsdXN0ZXJmc19kb25lLAotCQkJCXN0
YXRlKTsKLQlpZiAocmV0IDwgMCkgewotCQl0ZXZlbnRfcmVxX2Vycm9yKHJlcSwgLXJldCk7CisJ
U01CUFJPRklMRV9CWVRFU19BU1lOQ19TRVRfSURMRShzdGF0ZS0+cHJvZmlsZV9ieXRlcyk7CisK
KwlzdWJyZXEgPSBwdGhyZWFkcG9vbF90ZXZlbnRfam9iX3NlbmQoCisJCXN0YXRlLCBldiwgaGFu
ZGxlLT5jb25uLT5zY29ubi0+cG9vbCwKKwkJdmZzX2dsdXN0ZXJfcHdyaXRlX2RvLCBzdGF0ZSk7
CisJaWYgKHRldmVudF9yZXFfbm9tZW0oc3VicmVxLCByZXEpKSB7CiAJCXJldHVybiB0ZXZlbnRf
cmVxX3Bvc3QocmVxLCBldik7CiAJfQorCXRldmVudF9yZXFfc2V0X2NhbGxiYWNrKHN1YnJlcSwg
dmZzX2dsdXN0ZXJfcHdyaXRlX2RvbmUsIHJlcSk7CisKKwl0YWxsb2Nfc2V0X2Rlc3RydWN0b3Io
c3RhdGUsIHZmc19nbHVzdGVyX3B3cml0ZV9zdGF0ZV9kZXN0cnVjdG9yKTsKIAogCXJldHVybiBy
ZXE7CiB9CiAKLXN0YXRpYyBzdHJ1Y3QgdGV2ZW50X3JlcSAqdmZzX2dsdXN0ZXJfcHdyaXRlX3Nl
bmQoc3RydWN0IHZmc19oYW5kbGVfc3RydWN0Ci0JCQkJCQkgICpoYW5kbGUsIFRBTExPQ19DVFgg
Km1lbV9jdHgsCi0JCQkJCQkgIHN0cnVjdCB0ZXZlbnRfY29udGV4dCAqZXYsCi0JCQkJCQkgIGZp
bGVzX3N0cnVjdCAqZnNwLAotCQkJCQkJICBjb25zdCB2b2lkICpkYXRhLCBzaXplX3QgbiwKLQkJ
CQkJCSAgb2ZmX3Qgb2Zmc2V0KQorc3RhdGljIHZvaWQgdmZzX2dsdXN0ZXJfcHdyaXRlX2RvKHZv
aWQgKnByaXZhdGVfZGF0YSkKIHsKLQlzdHJ1Y3QgZ2x1c3RlcmZzX2Fpb19zdGF0ZSAqc3RhdGUg
PSBOVUxMOwotCXN0cnVjdCB0ZXZlbnRfcmVxICpyZXEgPSBOVUxMOwotCWludCByZXQgPSAwOwot
CWdsZnNfZmRfdCAqZ2xmZCA9IHZmc19nbHVzdGVyX2ZldGNoX2dsZmQoaGFuZGxlLCBmc3ApOwot
Ci0JaWYgKGdsZmQgPT0gTlVMTCkgewotCQlEQkdfRVJSKCJGYWlsZWQgdG8gZmV0Y2ggZ2x1c3Rl
ciBmZFxuIik7Ci0JCXJldHVybiBOVUxMOwotCX0KKwlzdHJ1Y3QgdmZzX2dsdXN0ZXJfcHdyaXRl
X3N0YXRlICpzdGF0ZSA9IHRhbGxvY19nZXRfdHlwZV9hYm9ydCgKKwkJcHJpdmF0ZV9kYXRhLCBz
dHJ1Y3QgdmZzX2dsdXN0ZXJfcHdyaXRlX3N0YXRlKTsKKwlzdHJ1Y3QgdGltZXNwZWMgc3RhcnRf
dGltZTsKKwlzdHJ1Y3QgdGltZXNwZWMgZW5kX3RpbWU7CiAKLQlzdGF0ZSA9IGFpb19zdGF0ZV9j
cmVhdGUobWVtX2N0eCk7CisJU01CUFJPRklMRV9CWVRFU19BU1lOQ19TRVRfQlVTWShzdGF0ZS0+
cHJvZmlsZV9ieXRlcyk7CiAKLQlpZiAoc3RhdGUgPT0gTlVMTCkgewotCQlyZXR1cm4gTlVMTDsK
LQl9CisJUFJPRklMRV9USU1FU1RBTVAoJnN0YXJ0X3RpbWUpOwogCi0JcmVxID0gc3RhdGUtPnJl
cTsKKwlkbyB7CisjaWZkZWYgSEFWRV9HRkFQSV9WRVJfN182CisJCXN0YXRlLT5yZXQgPSBnbGZz
X3B3cml0ZShzdGF0ZS0+ZmQsIHN0YXRlLT5idWYsIHN0YXRlLT5jb3VudCwKKwkJCQkJIHN0YXRl
LT5vZmZzZXQsIDAsIE5VTEwsIE5VTEwpOworI2Vsc2UKKwkJc3RhdGUtPnJldCA9IGdsZnNfcHdy
aXRlKHN0YXRlLT5mZCwgc3RhdGUtPmJ1Ziwgc3RhdGUtPmNvdW50LAorCQkJCQkgc3RhdGUtPm9m
ZnNldCwgMCk7CisjZW5kaWYKKwl9IHdoaWxlICgoc3RhdGUtPnJldCA9PSAtMSkgJiYgKGVycm5v
ID09IEVJTlRSKSk7CiAKLQlpZiAoIWluaXRfZ2x1c3Rlcl9haW8oaGFuZGxlKSkgewotCQl0ZXZl
bnRfcmVxX2Vycm9yKHJlcSwgRUlPKTsKLQkJcmV0dXJuIHRldmVudF9yZXFfcG9zdChyZXEsIGV2
KTsKKwlpZiAoc3RhdGUtPnJldCA9PSAtMSkgeworCQlzdGF0ZS0+dmZzX2Fpb19zdGF0ZS5lcnJv
ciA9IGVycm5vOwogCX0KIAotCS8qCi0JICogYWlvX2dsdXN0ZXJmc19kb25lIGFuZCBhaW9fdGV2
ZW50X2ZkX2RvbmUoKQotCSAqIHVzZSB0aGUgcmF3IHRldmVudCBjb250ZXh0LiBXZSBuZWVkIHRv
IHVzZQotCSAqIHRldmVudF9yZXFfZGVmZXJfY2FsbGJhY2soKSBpbiBvcmRlciB0bwotCSAqIHVz
ZSB0aGUgZXZlbnQgY29udGV4dCB3ZSdyZSBzdGFydGVkIHdpdGguCi0JICovCi0JdGV2ZW50X3Jl
cV9kZWZlcl9jYWxsYmFjayhyZXEsIGV2KTsKKwlQUk9GSUxFX1RJTUVTVEFNUCgmZW5kX3RpbWUp
OwogCi0JU01CUFJPRklMRV9CWVRFU19BU1lOQ19TVEFSVChzeXNjYWxsX2FzeXNfcHdyaXRlLCBw
cm9maWxlX3AsCi0JCQkJICAgICBzdGF0ZS0+cHJvZmlsZV9ieXRlcywgbik7Ci0JUFJPRklMRV9U
SU1FU1RBTVAoJnN0YXRlLT5zdGFydCk7Ci0JcmV0ID0gZ2xmc19wd3JpdGVfYXN5bmMoZ2xmZCwg
ZGF0YSwgbiwgb2Zmc2V0LCAwLCBhaW9fZ2x1c3RlcmZzX2RvbmUsCi0JCQkJc3RhdGUpOwotCWlm
IChyZXQgPCAwKSB7Ci0JCXRldmVudF9yZXFfZXJyb3IocmVxLCAtcmV0KTsKLQkJcmV0dXJuIHRl
dmVudF9yZXFfcG9zdChyZXEsIGV2KTsKLQl9CisJc3RhdGUtPnZmc19haW9fc3RhdGUuZHVyYXRp
b24gPSBuc2VjX3RpbWVfZGlmZigmZW5kX3RpbWUsICZzdGFydF90aW1lKTsKIAotCXJldHVybiBy
ZXE7CisJU01CUFJPRklMRV9CWVRFU19BU1lOQ19TRVRfSURMRShzdGF0ZS0+cHJvZmlsZV9ieXRl
cyk7CiB9CiAKLXN0YXRpYyBzc2l6ZV90IHZmc19nbHVzdGVyX3JlY3Yoc3RydWN0IHRldmVudF9y
ZXEgKnJlcSwKLQkJCQlzdHJ1Y3QgdmZzX2Fpb19zdGF0ZSAqdmZzX2Fpb19zdGF0ZSkKK3N0YXRp
YyBpbnQgdmZzX2dsdXN0ZXJfcHdyaXRlX3N0YXRlX2Rlc3RydWN0b3Ioc3RydWN0IHZmc19nbHVz
dGVyX3B3cml0ZV9zdGF0ZSAqc3RhdGUpCiB7Ci0Jc3RydWN0IGdsdXN0ZXJmc19haW9fd3JhcHBl
ciAqd3JhcHBlciA9IE5VTEw7Ci0JaW50IHJldCA9IDA7CisJcmV0dXJuIC0xOworfQogCi0Jd3Jh
cHBlciA9IHRldmVudF9yZXFfZGF0YShyZXEsIHN0cnVjdCBnbHVzdGVyZnNfYWlvX3dyYXBwZXIp
Oworc3RhdGljIHZvaWQgdmZzX2dsdXN0ZXJfcHdyaXRlX2RvbmUoc3RydWN0IHRldmVudF9yZXEg
KnN1YnJlcSkKK3sKKwlzdHJ1Y3QgdGV2ZW50X3JlcSAqcmVxID0gdGV2ZW50X3JlcV9jYWxsYmFj
a19kYXRhKAorCQlzdWJyZXEsIHN0cnVjdCB0ZXZlbnRfcmVxKTsKKwlzdHJ1Y3QgdmZzX2dsdXN0
ZXJfcHdyaXRlX3N0YXRlICpzdGF0ZSA9IHRldmVudF9yZXFfZGF0YSgKKwkJcmVxLCBzdHJ1Y3Qg
dmZzX2dsdXN0ZXJfcHdyaXRlX3N0YXRlKTsKKwlpbnQgcmV0OwogCi0JaWYgKHdyYXBwZXIgPT0g
TlVMTCkgewotCQlyZXR1cm4gLTE7CisJcmV0ID0gcHRocmVhZHBvb2xfdGV2ZW50X2pvYl9yZWN2
KHN1YnJlcSk7CisJVEFMTE9DX0ZSRUUoc3VicmVxKTsKKwlTTUJQUk9GSUxFX0JZVEVTX0FTWU5D
X0VORChzdGF0ZS0+cHJvZmlsZV9ieXRlcyk7CisJdGFsbG9jX3NldF9kZXN0cnVjdG9yKHN0YXRl
LCBOVUxMKTsKKwlpZiAocmV0ICE9IDApIHsKKwkJaWYgKHJldCAhPSBFQUdBSU4pIHsKKwkJCXRl
dmVudF9yZXFfZXJyb3IocmVxLCByZXQpOworCQkJcmV0dXJuOworCQl9CisJCS8qCisJCSAqIElm
IHdlIGdldCBFQUdBSU4gZnJvbSBwdGhyZWFkcG9vbF90ZXZlbnRfam9iX3JlY3YoKSB0aGlzCisJ
CSAqIG1lYW5zIHRoZSBsb3dlciBsZXZlbCBwdGhyZWFkcG9vbCBmYWlsZWQgdG8gY3JlYXRlIGEg
bmV3CisJCSAqIHRocmVhZC4gRmFsbGJhY2sgdG8gc3luYyBwcm9jZXNzaW5nIGluIHRoYXQgY2Fz
ZSB0byBhbGxvdworCQkgKiBzb21lIHByb2dyZXNzIGZvciB0aGUgY2xpZW50LgorCQkgKi8KKwkJ
dmZzX2dsdXN0ZXJfcHdyaXRlX2RvKHN0YXRlKTsKIAl9CiAKLQlpZiAod3JhcHBlci0+c3RhdGUg
PT0gTlVMTCkgewotCQlyZXR1cm4gLTE7Ci0JfQorCXRldmVudF9yZXFfZG9uZShyZXEpOworfQor
CitzdGF0aWMgc3NpemVfdCB2ZnNfZ2x1c3Rlcl9wd3JpdGVfcmVjdihzdHJ1Y3QgdGV2ZW50X3Jl
cSAqcmVxLAorCQkJCSAgICAgICBzdHJ1Y3QgdmZzX2Fpb19zdGF0ZSAqdmZzX2Fpb19zdGF0ZSkK
K3sKKwlzdHJ1Y3QgdmZzX2dsdXN0ZXJfcHdyaXRlX3N0YXRlICpzdGF0ZSA9IHRldmVudF9yZXFf
ZGF0YSgKKwkJcmVxLCBzdHJ1Y3QgdmZzX2dsdXN0ZXJfcHdyaXRlX3N0YXRlKTsKIAogCWlmICh0
ZXZlbnRfcmVxX2lzX3VuaXhfZXJyb3IocmVxLCAmdmZzX2Fpb19zdGF0ZS0+ZXJyb3IpKSB7CiAJ
CXJldHVybiAtMTsKIAl9CiAKLQkqdmZzX2Fpb19zdGF0ZSA9IHdyYXBwZXItPnN0YXRlLT52ZnNf
YWlvX3N0YXRlOwotCXJldCA9IHdyYXBwZXItPnN0YXRlLT5yZXQ7CisJKnZmc19haW9fc3RhdGUg
PSBzdGF0ZS0+dmZzX2Fpb19zdGF0ZTsKIAotCS8qIENsZWFuIHVwIHRoZSBzdGF0ZSwgaXQgaXMg
aW4gYSBOVUxMIGNvbnRleHQuICovCi0KLQlUQUxMT0NfRlJFRSh3cmFwcGVyLT5zdGF0ZSk7Ci0K
LQlyZXR1cm4gcmV0OworCXJldHVybiBzdGF0ZS0+cmV0OwogfQogCiBzdGF0aWMgc3NpemVfdCB2
ZnNfZ2x1c3Rlcl9wd3JpdGUoc3RydWN0IHZmc19oYW5kbGVfc3RydWN0ICpoYW5kbGUsCkBAIC0x
MTE1LDYwICsxMDY5LDEzMiBAQCBzdGF0aWMgaW50IHZmc19nbHVzdGVyX3JlbmFtZWF0KHN0cnVj
dCB2ZnNfaGFuZGxlX3N0cnVjdCAqaGFuZGxlLAogCXJldHVybiByZXQ7CiB9CiAKK3N0cnVjdCB2
ZnNfZ2x1c3Rlcl9mc3luY19zdGF0ZSB7CisJc3NpemVfdCByZXQ7CisJZ2xmc19mZF90ICpmZDsK
KworCXN0cnVjdCB2ZnNfYWlvX3N0YXRlIHZmc19haW9fc3RhdGU7CisJU01CUFJPRklMRV9CWVRF
U19BU1lOQ19TVEFURShwcm9maWxlX2J5dGVzKTsKK307CisKK3N0YXRpYyB2b2lkIHZmc19nbHVz
dGVyX2ZzeW5jX2RvKHZvaWQgKnByaXZhdGVfZGF0YSk7CitzdGF0aWMgdm9pZCB2ZnNfZ2x1c3Rl
cl9mc3luY19kb25lKHN0cnVjdCB0ZXZlbnRfcmVxICpzdWJyZXEpOworc3RhdGljIGludCB2ZnNf
Z2x1c3Rlcl9mc3luY19zdGF0ZV9kZXN0cnVjdG9yKHN0cnVjdCB2ZnNfZ2x1c3Rlcl9mc3luY19z
dGF0ZSAqc3RhdGUpOworCiBzdGF0aWMgc3RydWN0IHRldmVudF9yZXEgKnZmc19nbHVzdGVyX2Zz
eW5jX3NlbmQoc3RydWN0IHZmc19oYW5kbGVfc3RydWN0CiAJCQkJCQkgKmhhbmRsZSwgVEFMTE9D
X0NUWCAqbWVtX2N0eCwKIAkJCQkJCSBzdHJ1Y3QgdGV2ZW50X2NvbnRleHQgKmV2LAogCQkJCQkJ
IGZpbGVzX3N0cnVjdCAqZnNwKQogewotCXN0cnVjdCB0ZXZlbnRfcmVxICpyZXEgPSBOVUxMOwot
CXN0cnVjdCBnbHVzdGVyZnNfYWlvX3N0YXRlICpzdGF0ZSA9IE5VTEw7Ci0JaW50IHJldCA9IDA7
Ci0JZ2xmc19mZF90ICpnbGZkID0gdmZzX2dsdXN0ZXJfZmV0Y2hfZ2xmZChoYW5kbGUsIGZzcCk7
CisJc3RydWN0IHRldmVudF9yZXEgKnJlcSwgKnN1YnJlcTsKKwlzdHJ1Y3QgdmZzX2dsdXN0ZXJf
ZnN5bmNfc3RhdGUgKnN0YXRlOwogCisJZ2xmc19mZF90ICpnbGZkID0gdmZzX2dsdXN0ZXJfZmV0
Y2hfZ2xmZChoYW5kbGUsIGZzcCk7CiAJaWYgKGdsZmQgPT0gTlVMTCkgewogCQlEQkdfRVJSKCJG
YWlsZWQgdG8gZmV0Y2ggZ2x1c3RlciBmZFxuIik7CiAJCXJldHVybiBOVUxMOwogCX0KIAotCXN0
YXRlID0gYWlvX3N0YXRlX2NyZWF0ZShtZW1fY3R4KTsKLQotCWlmIChzdGF0ZSA9PSBOVUxMKSB7
CisJcmVxID0gdGV2ZW50X3JlcV9jcmVhdGUobWVtX2N0eCwgJnN0YXRlLCBzdHJ1Y3QgdmZzX2ds
dXN0ZXJfZnN5bmNfc3RhdGUpOworCWlmIChyZXEgPT0gTlVMTCkgewogCQlyZXR1cm4gTlVMTDsK
IAl9CiAKLQlyZXEgPSBzdGF0ZS0+cmVxOworCXN0YXRlLT5yZXQgPSAtMTsKKwlzdGF0ZS0+ZmQg
PSBnbGZkOwogCi0JaWYgKCFpbml0X2dsdXN0ZXJfYWlvKGhhbmRsZSkpIHsKLQkJdGV2ZW50X3Jl
cV9lcnJvcihyZXEsIEVJTyk7CisJU01CUFJPRklMRV9CWVRFU19BU1lOQ19TVEFSVChzeXNjYWxs
X2FzeXNfZnN5bmMsIHByb2ZpbGVfcCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdGF0ZS0+cHJvZmlsZV9ieXRlcywgMCk7CisJU01CUFJPRklMRV9CWVRFU19BU1lOQ19T
RVRfSURMRShzdGF0ZS0+cHJvZmlsZV9ieXRlcyk7CisKKwlzdWJyZXEgPSBwdGhyZWFkcG9vbF90
ZXZlbnRfam9iX3NlbmQoCisJCXN0YXRlLCBldiwgaGFuZGxlLT5jb25uLT5zY29ubi0+cG9vbCwg
dmZzX2dsdXN0ZXJfZnN5bmNfZG8sIHN0YXRlKTsKKwlpZiAodGV2ZW50X3JlcV9ub21lbShzdWJy
ZXEsIHJlcSkpIHsKIAkJcmV0dXJuIHRldmVudF9yZXFfcG9zdChyZXEsIGV2KTsKIAl9CisJdGV2
ZW50X3JlcV9zZXRfY2FsbGJhY2soc3VicmVxLCB2ZnNfZ2x1c3Rlcl9mc3luY19kb25lLCByZXEp
OwogCi0JLyoKLQkgKiBhaW9fZ2x1c3RlcmZzX2RvbmUgYW5kIGFpb190ZXZlbnRfZmRfZG9uZSgp
Ci0JICogdXNlIHRoZSByYXcgdGV2ZW50IGNvbnRleHQuIFdlIG5lZWQgdG8gdXNlCi0JICogdGV2
ZW50X3JlcV9kZWZlcl9jYWxsYmFjaygpIGluIG9yZGVyIHRvCi0JICogdXNlIHRoZSBldmVudCBj
b250ZXh0IHdlJ3JlIHN0YXJ0ZWQgd2l0aC4KLQkgKi8KLQl0ZXZlbnRfcmVxX2RlZmVyX2NhbGxi
YWNrKHJlcSwgZXYpOworCXRhbGxvY19zZXRfZGVzdHJ1Y3RvcihzdGF0ZSwgdmZzX2dsdXN0ZXJf
ZnN5bmNfc3RhdGVfZGVzdHJ1Y3Rvcik7CiAKLQlTTUJQUk9GSUxFX0JZVEVTX0FTWU5DX1NUQVJU
KHN5c2NhbGxfYXN5c19mc3luYywgcHJvZmlsZV9wLAotCQkJCSAgICAgc3RhdGUtPnByb2ZpbGVf
Ynl0ZXMsIDApOwotCVBST0ZJTEVfVElNRVNUQU1QKCZzdGF0ZS0+c3RhcnQpOwotCXJldCA9IGds
ZnNfZnN5bmNfYXN5bmMoZ2xmZCwgYWlvX2dsdXN0ZXJmc19kb25lLCBzdGF0ZSk7Ci0JaWYgKHJl
dCA8IDApIHsKLQkJdGV2ZW50X3JlcV9lcnJvcihyZXEsIC1yZXQpOwotCQlyZXR1cm4gdGV2ZW50
X3JlcV9wb3N0KHJlcSwgZXYpOwotCX0KIAlyZXR1cm4gcmVxOwogfQogCitzdGF0aWMgdm9pZCB2
ZnNfZ2x1c3Rlcl9mc3luY19kbyh2b2lkICpwcml2YXRlX2RhdGEpCit7CisJc3RydWN0IHZmc19n
bHVzdGVyX2ZzeW5jX3N0YXRlICpzdGF0ZSA9IHRhbGxvY19nZXRfdHlwZV9hYm9ydCgKKwkJcHJp
dmF0ZV9kYXRhLCBzdHJ1Y3QgdmZzX2dsdXN0ZXJfZnN5bmNfc3RhdGUpOworCXN0cnVjdCB0aW1l
c3BlYyBzdGFydF90aW1lOworCXN0cnVjdCB0aW1lc3BlYyBlbmRfdGltZTsKKworCVNNQlBST0ZJ
TEVfQllURVNfQVNZTkNfU0VUX0JVU1koc3RhdGUtPnByb2ZpbGVfYnl0ZXMpOworCisJUFJPRklM
RV9USU1FU1RBTVAoJnN0YXJ0X3RpbWUpOworCisJZG8geworI2lmZGVmIEhBVkVfR0ZBUElfVkVS
XzdfNgorCQlzdGF0ZS0+cmV0ID0gZ2xmc19mc3luYyhzdGF0ZS0+ZmQsIE5VTEwsIE5VTEwpOwor
I2Vsc2UKKwkJc3RhdGUtPnJldCA9IGdsZnNfZnN5bmMoc3RhdGUtPmZkKTsKKyNlbmRpZgorCX0g
d2hpbGUgKChzdGF0ZS0+cmV0ID09IC0xKSAmJiAoZXJybm8gPT0gRUlOVFIpKTsKKworCWlmIChz
dGF0ZS0+cmV0ID09IC0xKSB7CisJCXN0YXRlLT52ZnNfYWlvX3N0YXRlLmVycm9yID0gZXJybm87
CisJfQorCisJUFJPRklMRV9USU1FU1RBTVAoJmVuZF90aW1lKTsKKworCXN0YXRlLT52ZnNfYWlv
X3N0YXRlLmR1cmF0aW9uID0gbnNlY190aW1lX2RpZmYoJmVuZF90aW1lLCAmc3RhcnRfdGltZSk7
CisKKwlTTUJQUk9GSUxFX0JZVEVTX0FTWU5DX1NFVF9JRExFKHN0YXRlLT5wcm9maWxlX2J5dGVz
KTsKK30KKworc3RhdGljIGludCB2ZnNfZ2x1c3Rlcl9mc3luY19zdGF0ZV9kZXN0cnVjdG9yKHN0
cnVjdCB2ZnNfZ2x1c3Rlcl9mc3luY19zdGF0ZSAqc3RhdGUpCit7CisJcmV0dXJuIC0xOworfQor
CitzdGF0aWMgdm9pZCB2ZnNfZ2x1c3Rlcl9mc3luY19kb25lKHN0cnVjdCB0ZXZlbnRfcmVxICpz
dWJyZXEpCit7CisJc3RydWN0IHRldmVudF9yZXEgKnJlcSA9IHRldmVudF9yZXFfY2FsbGJhY2tf
ZGF0YSgKKwkJc3VicmVxLCBzdHJ1Y3QgdGV2ZW50X3JlcSk7CisJc3RydWN0IHZmc19nbHVzdGVy
X2ZzeW5jX3N0YXRlICpzdGF0ZSA9IHRldmVudF9yZXFfZGF0YSgKKwkJcmVxLCBzdHJ1Y3QgdmZz
X2dsdXN0ZXJfZnN5bmNfc3RhdGUpOworCWludCByZXQ7CisKKwlyZXQgPSBwdGhyZWFkcG9vbF90
ZXZlbnRfam9iX3JlY3Yoc3VicmVxKTsKKwlUQUxMT0NfRlJFRShzdWJyZXEpOworCVNNQlBST0ZJ
TEVfQllURVNfQVNZTkNfRU5EKHN0YXRlLT5wcm9maWxlX2J5dGVzKTsKKwl0YWxsb2Nfc2V0X2Rl
c3RydWN0b3Ioc3RhdGUsIE5VTEwpOworCWlmIChyZXQgIT0gMCkgeworCQlpZiAocmV0ICE9IEVB
R0FJTikgeworCQkJdGV2ZW50X3JlcV9lcnJvcihyZXEsIHJldCk7CisJCQlyZXR1cm47CisJCX0K
KwkJLyoKKwkJICogSWYgd2UgZ2V0IEVBR0FJTiBmcm9tIHB0aHJlYWRwb29sX3RldmVudF9qb2Jf
cmVjdigpIHRoaXMKKwkJICogbWVhbnMgdGhlIGxvd2VyIGxldmVsIHB0aHJlYWRwb29sIGZhaWxl
ZCB0byBjcmVhdGUgYSBuZXcKKwkJICogdGhyZWFkLiBGYWxsYmFjayB0byBzeW5jIHByb2Nlc3Np
bmcgaW4gdGhhdCBjYXNlIHRvIGFsbG93CisJCSAqIHNvbWUgcHJvZ3Jlc3MgZm9yIHRoZSBjbGll
bnQuCisJCSAqLworCQl2ZnNfZ2x1c3Rlcl9mc3luY19kbyhzdGF0ZSk7CisJfQorCisJdGV2ZW50
X3JlcV9kb25lKHJlcSk7Cit9CisKIHN0YXRpYyBpbnQgdmZzX2dsdXN0ZXJfZnN5bmNfcmVjdihz
dHJ1Y3QgdGV2ZW50X3JlcSAqcmVxLAogCQkJCSAgc3RydWN0IHZmc19haW9fc3RhdGUgKnZmc19h
aW9fc3RhdGUpCiB7Ci0JLyoKLQkgKiBVc2UgaW1wbGljaXQgY29udmVyc2lvbiBzc2l6ZV90LT5p
bnQKLQkgKi8KLQlyZXR1cm4gdmZzX2dsdXN0ZXJfcmVjdihyZXEsIHZmc19haW9fc3RhdGUpOwor
CXN0cnVjdCB2ZnNfZ2x1c3Rlcl9mc3luY19zdGF0ZSAqc3RhdGUgPSB0ZXZlbnRfcmVxX2RhdGEo
CisJCXJlcSwgc3RydWN0IHZmc19nbHVzdGVyX2ZzeW5jX3N0YXRlKTsKKworCWlmICh0ZXZlbnRf
cmVxX2lzX3VuaXhfZXJyb3IocmVxLCAmdmZzX2Fpb19zdGF0ZS0+ZXJyb3IpKSB7CisJCXJldHVy
biAtMTsKKwl9CisKKwkqdmZzX2Fpb19zdGF0ZSA9IHN0YXRlLT52ZnNfYWlvX3N0YXRlOworCXJl
dHVybiBzdGF0ZS0+cmV0OwogfQogCiBzdGF0aWMgaW50IHZmc19nbHVzdGVyX3N0YXQoc3RydWN0
IHZmc19oYW5kbGVfc3RydWN0ICpoYW5kbGUsCkBAIC0xODcxLDEwICsxODk3LDEwIEBAIHN0YXRp
YyBzdHJ1Y3QgdmZzX2ZuX3BvaW50ZXJzIGdsdXN0ZXJmc19mbnMgPSB7CiAJLmNsb3NlX2ZuID0g
dmZzX2dsdXN0ZXJfY2xvc2UsCiAJLnByZWFkX2ZuID0gdmZzX2dsdXN0ZXJfcHJlYWQsCiAJLnBy
ZWFkX3NlbmRfZm4gPSB2ZnNfZ2x1c3Rlcl9wcmVhZF9zZW5kLAotCS5wcmVhZF9yZWN2X2ZuID0g
dmZzX2dsdXN0ZXJfcmVjdiwKKwkucHJlYWRfcmVjdl9mbiA9IHZmc19nbHVzdGVyX3ByZWFkX3Jl
Y3YsCiAJLnB3cml0ZV9mbiA9IHZmc19nbHVzdGVyX3B3cml0ZSwKIAkucHdyaXRlX3NlbmRfZm4g
PSB2ZnNfZ2x1c3Rlcl9wd3JpdGVfc2VuZCwKLQkucHdyaXRlX3JlY3ZfZm4gPSB2ZnNfZ2x1c3Rl
cl9yZWN2LAorCS5wd3JpdGVfcmVjdl9mbiA9IHZmc19nbHVzdGVyX3B3cml0ZV9yZWN2LAogCS5s
c2Vla19mbiA9IHZmc19nbHVzdGVyX2xzZWVrLAogCS5zZW5kZmlsZV9mbiA9IHZmc19nbHVzdGVy
X3NlbmRmaWxlLAogCS5yZWN2ZmlsZV9mbiA9IHZmc19nbHVzdGVyX3JlY3ZmaWxlLAotLSAKMi4y
MS4wCgo=


--=-+S9Sh624DE3ZHZvOvSk5--


